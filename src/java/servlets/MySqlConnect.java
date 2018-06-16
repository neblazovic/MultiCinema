
package servlets;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Nebojsa Lazovic
 */
public class MySqlConnect  {
    DataSource ds;
    Connection connection;
    Statement st;
    
    public MySqlConnect() {
        
        try{
            InitialContext initialContext=new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");            
            ds = (DataSource) context.lookup("multiCinema");
            connection = ds.getConnection();
        } catch (NamingException ex) {
            Logger.getLogger(MySqlConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch(SQLException sqle){
            System.out.println(sqle);
        }
    }
    public void insert(String upit){
        if(connection!=null){
        try{
            st=connection.createStatement();
            st.executeUpdate(upit);
        }
        catch(SQLException sqle){
            System.out.println("Greska pri konekciji, "+sqle);
        
        }
    }
    }
    public ResultSet query(String upit){
        ResultSet rs=null;
        try{
            st=connection.createStatement();
            rs=st.executeQuery(upit);
            
            return rs;
        }
        catch(SQLException sqle){
            System.out.println("Greska pri citanju iz baze, "+sqle);
            return rs;
        }
        
    }
}
