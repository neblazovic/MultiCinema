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
public class Klub {
    private String nazivKluba = "";
    private int idKluba;
    private double popust=0.0;
    public Klub() {
    }

    public String getNazivKluba() {
        return nazivKluba;
    }

    public void setNazivKluba(String nazivKluba) {
        this.nazivKluba = nazivKluba;
    }

    public int getIdKluba() {
        return idKluba;
    }

    public double getPopust() {
        return popust;
    }

    public void setPopust(double popust) {
        this.popust = popust;
    }
    
}
