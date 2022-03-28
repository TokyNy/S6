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
    
    public double getSommePourBoire(String date1,String date2,double pourc,Connection con)throws Exception{
        String req="SELECT SUM(prix) as prix FROM vue_total_par_commande WHERE idServeur='"+this.getId()+"' and date>='"+date1+"' and date<='"+date2+"'";
        double retour=0.0;
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour=(res.getDouble("prix")*pourc)/100;
        }
        return retour;
    }
}
