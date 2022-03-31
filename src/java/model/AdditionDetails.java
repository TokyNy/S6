/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connexion.Connexion;
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
    
    public static void ajoutDetail(String idAddition,String idPlat,String idServeur,Connection con)throws Exception{
        Plat p=Plat.getById(idPlat, con);
        String req="INSERT INTO AdditionDetails VALUES(default,'"+idAddition+"','"+idPlat+"',"+p.getPrix()+",'"+idServeur+"')";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
    }
    public static void ajouter(String idAddition,String idPlat,String qte,String idServeur)throws Exception{
        Connection con=Connexion.getConnection();
        con.setAutoCommit(false);
        int quantite=Integer.valueOf(qte);
        try{
            for(int i=0;i<quantite;i++){
                ajoutDetail(idAddition,idPlat,idServeur,con);
                
            }
            con.commit();
        }catch(Exception e){
            con.rollback();
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }finally{
            con.close();
        }
        
        
    }
    
}
