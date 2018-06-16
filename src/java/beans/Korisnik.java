
package beans;

public class Korisnik {
    String ime,prezime,username,password, telefon="",datumRodjenja=""; 
    String adresa="",grad="", drzava="", email="",radnoMesto="", creditCard="", clubCard="";
    int aktivan;

    public int getAktivan() {
        return aktivan;
    }

    public void setAktivan(int aktivan) {
        this.aktivan = aktivan;
    }
 

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    public String getDatumRodjenja() {
        return datumRodjenja;
    }

    public void setDatumRodjenja(String datumRodjenja) {
        this.datumRodjenja = datumRodjenja;
    }

    public String getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(String creditCard) {
        this.creditCard = creditCard;
    }

    public String getClubCard() {
        return clubCard;
    }

    public void setClubCard(String clubCard) {
        this.clubCard = clubCard;
    }

   public Korisnik() {
       
    }

    public Korisnik(String ime, String prezime, String username, String password, String telefon, String adresa, String grad, String drzava, String email, String datumRodjenja,String card,int aktivan) {
        
        this.ime = ime;
        this.prezime = prezime;
        this.username = username;
        this.password = password;
        this.telefon = telefon;
        this.adresa = adresa;
        this.grad = grad;
        this.drzava = drzava;
        this.email = email;
        this.datumRodjenja = datumRodjenja;
        this.creditCard = card;
        this.aktivan=aktivan;
    }
    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRadnoMesto() {
        return radnoMesto;
    }

    public void setRadnoMesto(String radnoMesto) {
        this.radnoMesto = radnoMesto;
    }
    
   
}
