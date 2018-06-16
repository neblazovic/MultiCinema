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
public class Projekcija {
    int id_projekcije,id_tehnologije,id_filma,id_bioskopa,id_sale;
    String datumprojekcije;

    public Projekcija() {
    }

    public Projekcija(int id_projekcije, int id_tehnologije, int id_filma, int id_bioskopa, int id_sale, String datumprojekcije) {
        this.id_projekcije = id_projekcije;
        this.id_tehnologije = id_tehnologije;
        this.id_filma = id_filma;
        this.id_bioskopa = id_bioskopa;
        this.id_sale = id_sale;
        this.datumprojekcije = datumprojekcije;
    }

    public Projekcija(int id_projekcije, int id_tehnologije, int id_filma, int id_bioskopa, String datumprojekcije) {
        this.id_projekcije = id_projekcije;
        this.id_tehnologije = id_tehnologije;
        this.id_filma = id_filma;
        this.id_bioskopa = id_bioskopa;
        this.datumprojekcije = datumprojekcije;
    }

    public int getId_projekcije() {
        return id_projekcije;
    }

    public void setId_projekcije(int id_projekcije) {
        this.id_projekcije = id_projekcije;
    }

    public int getId_tehnologije() {
        return id_tehnologije;
    }

    public void setId_tehnologije(int id_tehnologije) {
        this.id_tehnologije = id_tehnologije;
    }

    public int getId_filma() {
        return id_filma;
    }

    public void setId_filma(int id_filma) {
        this.id_filma = id_filma;
    }

    public int getId_bioskopa() {
        return id_bioskopa;
    }

    public void setId_bioskopa(int id_bioskopa) {
        this.id_bioskopa = id_bioskopa;
    }

    public int getId_sale() {
        return id_sale;
    }

    public void setId_sale(int id_sale) {
        this.id_sale = id_sale;
    }

    public String getDatumprojekcije() {
        return datumprojekcije;
    }

    public void setDatumprojekcije(String datumprojekcije) {
        this.datumprojekcije = datumprojekcije;
    }

    
}
