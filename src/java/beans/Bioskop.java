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
public class Bioskop implements Serializable{
    int id_bioskopa,br_sala;
    String naziv_bioskopa,link_slike,adresa;

    public Bioskop() {
    }

    public Bioskop(int id_bioskopa, int br_sala, String naziv_bioskopa, String link_slike, String adresa) {
        this.id_bioskopa = id_bioskopa;
        this.br_sala = br_sala;
        this.naziv_bioskopa = naziv_bioskopa;
        this.link_slike = link_slike;
        this.adresa = adresa;
    }

    public Bioskop(int br_sala, String naziv_bioskopa, String link_slike, String adresa) {
        this.br_sala = br_sala;
        this.naziv_bioskopa = naziv_bioskopa;
        this.link_slike = link_slike;
        this.adresa = adresa;
    }

    public Bioskop(int id_bioskopa, int br_sala, String naziv_bioskopa, String link_slike) {
        this.id_bioskopa = id_bioskopa;
        this.br_sala = br_sala;
        this.naziv_bioskopa = naziv_bioskopa;
        this.link_slike = link_slike;
    }

    public int getId_bioskopa() {
        return id_bioskopa;
    }

    public void setId_bioskopa(int id_bioskopa) {
        this.id_bioskopa = id_bioskopa;
    }

    public int getBr_sala() {
        return br_sala;
    }

    public void setBr_sala(int br_sala) {
        this.br_sala = br_sala;
    }

    public String getNaziv_bioskopa() {
        return naziv_bioskopa;
    }

    public void setNaziv_bioskopa(String naziv_bioskopa) {
        this.naziv_bioskopa = naziv_bioskopa;
    }

    public String getLink_slike() {
        return link_slike;
    }

    public void setLink_slike(String link_slike) {
        this.link_slike = link_slike;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }
    
}
