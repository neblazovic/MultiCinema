/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;

/**
 *
 * @author Nebojsa
 */
public class Tehnologija implements Serializable{
    int id_tehnologije;
    String naziv_tehnologije,link;

    public Tehnologija() {
    }

    public Tehnologija(int id_tehnologije, String naziv_tehnologije, String link) {
        this.id_tehnologije = id_tehnologije;
        this.naziv_tehnologije = naziv_tehnologije;
        this.link = link;
    }
    

    public int getId_tehnologije() {
        return id_tehnologije;
    }

    public void setId_tehnologije(int id_tehnologije) {
        this.id_tehnologije = id_tehnologije;
    }

    public String getNaziv_tehnologije() {
        return naziv_tehnologije;
    }

    public void setNaziv_tehnologije(String naziv_tehnologije) {
        this.naziv_tehnologije = naziv_tehnologije;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
}
