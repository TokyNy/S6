/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connexion.Connexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Inventaire {
    String id;
    String idIngredient;
    double quantite;
    Date date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdIngredient() {
        return idIngredient;
    }

    public void setIdIngredient(String idIngredient) {
        this.idIngredient = idIngredient;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Inventaire() {
    }

    public Inventaire(String id, String idIngredient, double quantite, Date date) {
        this.id = id;
        this.idIngredient = idIngredient;
        this.quantite = quantite;
        this.date = date;
    }
    
    public static Inventaire getDernierInventaireAvant(Date date)throws Exception{
        String req="SELECT * FROM Inventaire WHERE date<='"+date+"' ORDER BY date LIMIT 1";
        Inventaire retour=null;
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour=new Inventaire(res.getString("id"),res.getString("idIngredient"),res.getDouble("quantite"),res.getDate("date"));
        }
        return retour;
    }
}
