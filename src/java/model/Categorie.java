/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author ASUS
 */
public class Categorie {
    String id;
    String descri;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public Categorie() {
    }

    public Categorie(String id, String descri) {
        this.id = id;
        this.descri = descri;
    }
    
    public static Vector<Categorie> getAll(Connection con)throws Exception{
        Vector<Categorie> retour=new Vector();
        String req="SELECT * FROM Categorie";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Categorie c=new Categorie(res.getString("id"),res.getString("descri"));
            retour.add(c);
        }
        return retour;
    }
}
