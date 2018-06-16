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
public class Sediste implements Serializable{
    int idSedista, zauzeto,invalidsko,odabrano,idSale;
    String brojSedista;

    public int getIdSedista() {
        return idSedista;
    }

    public void setIdSedista(int idSedista) {
        this.idSedista = idSedista;
    }

    public int getZauzeto() {
        return zauzeto;
    }

    public void setZauzeto(int zauzeto) {
        this.zauzeto = zauzeto;
    }

    public int getInvalidsko() {
        return invalidsko;
    }

    public void setInvalidsko(int invalidsko) {
        this.invalidsko = invalidsko;
    }

    public int getOdabrano() {
        return odabrano;
    }

    public void setOdabrano(int odabrano) {
        this.odabrano = odabrano;
    }

    public int getIdSale() {
        return idSale;
    }

    public void setIdSale(int idSale) {
        this.idSale = idSale;
    }

    public String getBrojSedista() {
        return brojSedista;
    }

    public void setBrojSedista(String brojSedista) {
        this.brojSedista = brojSedista;
    }

    public Sediste(int zauzeto, int invalidsko, int odabrano, int idSale, String brojSedista) {
        this.zauzeto = zauzeto;
        this.invalidsko = invalidsko;
        this.odabrano = odabrano;
        this.idSale = idSale;
        this.brojSedista = brojSedista;
    }

    public Sediste(int idSedista, int zauzeto, int invalidsko, int odabrano, int idSale, String brojSedista) {
        this.idSedista = idSedista;
        this.zauzeto = zauzeto;
        this.invalidsko = invalidsko;
        this.odabrano = odabrano;
        this.idSale = idSale;
        this.brojSedista = brojSedista;
    }

    public Sediste() {
    }
}
