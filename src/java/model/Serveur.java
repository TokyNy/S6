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
import java.text.SimpleDateFormat;
import java.util.Vector;
import java.util.Date;

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
    public double[] getSommePourBoire(String date1,String date2,double pourc)throws Exception{
        Connection con=Connexion.getConnection();
        double[] retour=new double[2];
        retour[0]=0.0;
        retour[1]=0.0;
        
        Date today=new Date();
        /*if(date1==null || date1.isEmpty()==true || date2==null || date2.isEmpty()==true){
            return retour;
        }*/
        System.out.println(date1);
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MMM-dd HH:mm");
        //Date d1=formatter.parse(date1.replace("T"," "));
        //Date d2=formatter.parse(date2.replace("T"," "));
        //if(d1.after(d2)){
        //    throw new Exception("Date1 doit etre anterieure à Date2");
        //}
        String sql="SELECT SUM(prix) as prix FROM vue_total_par_commande WHERE idServeur='"+this.getId()+"'";
        if(date1==null || date1.isEmpty()==true){
            if(date2==null || date2.isEmpty()==true)sql+=" AND date::TIMESTAMP::DATE>=CURRENT_DATE";
        }else{
            sql+=" AND date>='"+date1+"'";
        }
        if(date2==null || date2.isEmpty()==true){
            sql+=" AND date::TIMESTAMP::DATE<=CURRENT_DATE";
        }else{
            sql+=" AND date<='"+date2+"'";
        }
        System.out.println(sql);
        //String req="SELECT SUM(prix) as prix FROM vue_total_par_commande WHERE idServeur='"+this.getId()+"' and date>='"+date1+"' and date<='"+date2+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(sql);
        while(res.next()){
            retour[0]=res.getDouble("prix");
            retour[1]=(res.getDouble("prix")*pourc)/100;
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
