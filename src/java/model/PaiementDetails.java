package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class PaiementDetails {
    String id;
    String idTable;
    Date date;
    double prix=0.0;
    double montantPayer=0.0;
    double reste=0.0;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdTable() {
        return idTable;
    }

    public void setIdTable(String idTable) {
        this.idTable = idTable;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public double getMontantPayer() {
        return montantPayer;
    }

    public void setMontantPayer(double montantPayer) {
        this.montantPayer = montantPayer;
    }

    public double getReste() {
        return reste;
    }

    public void setReste(double reste) {
        this.reste = reste;
    }

    public PaiementDetails() {
    }

    public PaiementDetails(String id, String idTable, Date date, double prix, double montantPayer) {
        this.id = id;
        this.idTable = idTable;
        this.date = date;
        this.prix = prix;
        this.montantPayer = montantPayer;
        this.reste=prix-montantPayer;
    }
    
    
}