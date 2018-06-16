
package beans;


public class Film {
    int id, rating,aktuelan;
    String nazivFilma, zanr, linkTrejlera, linkFilma, linkPostera, uloge, reditelj, radnja;

    public int getId() {
        return id;
    }

    public String getRadnja() {
        return radnja;
    }

    public void setRadnja(String radnja) {
        this.radnja = radnja;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getZanr() {
        return zanr;
    }

    public void setZanr(String zanr) {
        this.zanr = zanr;
    }

    public String getNazivFilma() {
        return nazivFilma;
    }

    public void setNazivFilma(String nazivFilma) {
        this.nazivFilma = nazivFilma;
    }

    public String getLinkTrejlera() {
        return linkTrejlera;
    }

    public void setLinkTrejlera(String linkTrejlera) {
        this.linkTrejlera = linkTrejlera;
    }

    public String getLinkFilma() {
        return linkFilma;
    }

    public void setLinkFilma(String linkFilma) {
        this.linkFilma = linkFilma;
    }

    public String getLinkPostera() {
        return linkPostera;
    }

    public void setLinkPostera(String linkPostera) {
        this.linkPostera = linkPostera;
    }

    public String getUloge() {
        return uloge;
    }

    public void setUloge(String uloge) {
        this.uloge = uloge;
    }

    public String getReditelj() {
        return reditelj;
    }

    public void setReditelj(String reditelj) {
        this.reditelj = reditelj;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getAktuelan() {
        return aktuelan;
    }

    public void setAktuelan(int aktuelan) {
        this.aktuelan = aktuelan;
    }

    public Film() {
    }

    public Film(int id, String nazivFilma, String zanr, String linkTrejlera, String linkFilma, String linkPostera, String uloge, String reditelj, int rating, int aktuelan,String radnja) {
        this.id = id;
        this.nazivFilma = nazivFilma;
        this.zanr=zanr;
        this.linkTrejlera = linkTrejlera;
        this.linkFilma = linkFilma;
        this.linkPostera = linkPostera;
        this.uloge = uloge;
        this.reditelj = reditelj;
        this.rating = rating;
        this.aktuelan = aktuelan;        
        this.radnja = radnja;
    }
    
}
