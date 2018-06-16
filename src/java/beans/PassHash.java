/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Nebojsa
 */
import java.security.MessageDigest;
import java.util.Scanner;
public class PassHash {

    public PassHash() {
    }
    
    public String vratiHash(String pass)throws Exception{
        String password=pass;
        MessageDigest md = MessageDigest.getInstance("SHA-224");
        md.update(password.getBytes());
        byte byteData[] = md.digest();

        StringBuilder hexString = new StringBuilder();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
    	}
    	return hexString.toString();
        
}
}
