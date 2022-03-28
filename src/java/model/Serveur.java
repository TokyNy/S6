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
import java.util.Vector;

/**
 *
 * @author ASUS
 */
public class Serveur {
    String id;
    String nom;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Serveur(String id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public Serveur() {
    }
    
    
    public static Serveur getById(String id)throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM Serveur WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Serveur retour=null;
        while(res.next()){
            retour=new Serveur(res.getString("id"),res.getString("nom"));
        }
        con.close();
        return retour;
    }
    public double getSommePourBoire(String date1,String date2,double pourc)throws Exception{
        Connection con=Connexion.getConnection();
        if(date1==null || date1.isEmpty()==true || date2==null || date2.isEmpty()==true){
            return 0.0;
        }
        String req="SELECT SUM(prix) as prix FROM vue_total_par_commande WHERE idServeur='"+this.getId()+"' and date>='"+date1+"' and date<='"+date2+"'";
        double retour=0.0;
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour=(res.getDouble("prix")*pourc)/100;
        }
        con.close();
        return retour;
    }
    
    public static Vector<Serveur> getAll()throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM Serveur";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Vector<Serveur> retour=new Vector();
        while(res.next()){
            retour.add(new Serveur(res.getString("id"),res.getString("nom")));
        }
        con.close();
        return retour;
    }
}
