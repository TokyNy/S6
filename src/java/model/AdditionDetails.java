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
        String req="INSERT INTO AdditionDetails VALUES(default,'"+idAddition+"','"+idPlat+"',"+p.getPrix()+",'"+idServeur+"','0')";
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
    /*public static boolean estFini(String id)throws Exception{
        String req="SELECT COUNT(*) FROM AdditionDetails WHERE "
    }*/
    public static void finir(String id)throws Exception{
        Connection con=Connexion.getConnection();
        String req="UPDATE AdditionDetails set etat='2' WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        stmt.close();
        con.close();
    }
    public static void finir(String id,Connection con)throws Exception{
        String req="UPDATE AdditionDetails set etat='2' WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        stmt.close();
    }
    public static void livrer(String id)throws Exception{
        Connection con=Connexion.getConnection();
        String req="UPDATE AdditionDetails set etat='3' WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        stmt.close();
        con.close();
    }
    public static AdditionDetails getById(String id)throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM AdditionDetails WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        AdditionDetails retour=null;
        while(res.next()){
            retour=new AdditionDetails(res.getString("id"),res.getString("idAddition"),res.getString("idPlat"),res.getDouble("prix"));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
}
