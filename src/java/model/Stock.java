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
import java.util.Vector;

/**
 *
 * @author ASUS
 */
public class Stock {
    String id;
    String idIngredient;
    double poids;
    int etat;
    double prix;

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

    public double getPoids() {
        return poids;
    }

    public void setPoids(double poids) {
        this.poids = poids;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Stock() {
    }

    public Stock(String id, String idIngredient, double poids, int etat, double prix) {
        this.id = id;
        this.idIngredient = idIngredient;
        this.poids = poids;
        this.etat = etat;
        this.prix = prix;
    }
    
    public static void insert(String idIngredient,double poids,int etat,double prix,Connection con)throws Exception{
        String req="INSERT INTO Stock VALUES(default,'"+idIngredient+"',"+poids+","+etat+","+prix+")";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
    }
    public static Vector<Ingredients> getStockIngredient()throws Exception{
        Vector<Ingredients> retour=new Vector();
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM vue_stock_ingredient";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new Ingredients(res.getString("idIngredient"),res.getString("descri"),res.getDouble("stock")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static Vector<Ingredients> getStockIngredient(Date date)throws Exception{
        Vector<Ingredients> retour=new Vector();
        Connection con=Connexion.getConnection();
        Inventaire inventaire=Inventaire.getDernierInventaireAvant(date);
        String req="SELECT * FROM vue_stock_ingredient";
        if(inventaire!=null){
            req="";
        }
        
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new Ingredients(res.getString("idIngredient"),res.getString("descri"),res.getDouble("stock")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
}
