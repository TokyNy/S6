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

    public Ingredients(String id, String desc, Double poids) {
        this.id = id;
        this.desc = desc;
        this.poids = poids;
    }

    public Ingredients(String id, String desc) {
        this.id = id;
        this.desc = desc;
    }
    
    public boolean estDisponible(Connection con)throws Exception{
        double reste=0.0;
        String req="SELECT * FROM vue_stock_ingredients WHERE idIngredient='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            
        }
        return false;
    }
    
}
