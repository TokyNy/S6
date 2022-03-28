/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class AdditionDetails {
    String id;
    String idAddition;
    String idPlat;
    Double prix;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdAddition() {
        return idAddition;
    }

    public void setIdAddition(String idAddition) {
        this.idAddition = idAddition;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public AdditionDetails() {
    }

    public AdditionDetails(String id, String idAddition, String idPlat, Double prix) {
        this.id = id;
        this.idAddition = idAddition;
        this.idPlat = idPlat;
        this.prix = prix;
    }
    
    public static void ajoutDetail(String idAddition,String idPlat,Connection con)throws Exception{
        Plat p=Plat.getById(idPlat, con);
        String req="INSERT INTO AdditionDetails VALUES(default,'"+idAddition+"','"+idPlat+"',"+p.getPrix()+")";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
    }
    public static void ajouter(String idAddition,String idPlat,String qte,Connection con)throws Exception{
        int quantite=Integer.valueOf(qte);
        for(int i=0;i<quantite;i++){
            ajoutDetail(idAddition,idPlat,con);
        }
    }
}
