/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class Ingredients {
    String id;
    String desc;
    Double poids;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Double getPoids() {
        return poids;
    }

    public void setPoids(Double poids) {
        this.poids = poids;
    }

    public Ingredients() {
    }

    
    public Ingredients(String id, String desc) {
        this.id = id;
        this.desc = desc;
    }


    public Ingredients(String id, String desc, Double poids) {
        this.id = id;
        this.desc = desc;
        this.poids = poids;
    }
    public double getReste(Connection con)throws Exception{
        double reste=0.0;
        String req="SELECT * FROM vue_stock_ingredients WHERE idIngredient='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            reste=res.getDouble("reste");
        }
        res.close();
        stmt.close();
        return reste;
    }
    public boolean estDisponible(Connection con)throws Exception{
        double reste=0.0;
        String req="SELECT * FROM vue_stock_ingredients WHERE idIngredient='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            reste=res.getDouble("reste");
        }
        return false;
    }
    public static Ingredients getById(String id,Connection con)throws Exception{
        String req="SELECT * FROM Ingredients WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Ingredients retour=null;
        while(res.next()){
            retour=new Ingredients(res.getString("id"),res.getString("descri"));
        }
        return retour;
    }
    public double getPrixMoyen(Connection con)throws Exception{
        String req="SELECT * FROM vue_prix_moyen_ingredient WHERE idIngredient='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        double retour=0.0;
        while(res.next()){
            retour=res.getDouble("prix");
        }
        return retour;
    }
}
