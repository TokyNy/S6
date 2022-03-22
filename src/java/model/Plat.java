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
public class Plat {
    String id;
    String desc;
    Double prix;
    String idCategorie;

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

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public String getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(String idCategorie) {
        this.idCategorie = idCategorie;
    }

    public Plat() {
    }

    public Plat(String id, String desc, Double prix) {
        this.id = id;
        this.desc = desc;
        this.prix = prix;
    }

    public Plat(String id, String desc, Double prix, String idCategorie) {
        this.id = id;
        this.desc = desc;
        this.prix = prix;
        this.idCategorie = idCategorie;
    }
    
    public Vector<Ingredients> getListeIngredients(Connection con)throws Exception{
        Vector<Ingredients> retour=new Vector();
        String req="SELECT i.id,i.descri,pd.poids FROM Ingredients i join PlatDetails pd on i.id=pd.idIngredient WHERE pd.idPlat='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Ingredients i=new Ingredients(res.getString("id"),res.getString("descri"),res.getDouble("poids"));
            retour.add(i);
        }
        return retour;
    }
    public static Vector<Plat> getAll(Connection con)throws Exception{
        Vector<Plat> retour=new Vector();
        String req="SELECT * FROM Plat";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Plat i=new Plat(res.getString("id"),res.getString("descri"),res.getDouble("prix"));
            retour.add(i);
        }
        return retour;
    }
    public static Vector<Plat> getByIdCategorie(String idCategorie,Connection con)throws Exception{
        Vector<Plat> retour=new Vector();
        String req="SELECT * FROM Plat WHERE idCategorie='"+idCategorie+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Plat i=new Plat(res.getString("id"),res.getString("descri"),res.getDouble("prix"),res.getString("idCategorie"));
            retour.add(i);
        }
        return retour;
    }
}
