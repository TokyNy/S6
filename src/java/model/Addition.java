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
import java.util.Date;
import java.util.Vector;

/**
 *
 * @author ASUS
 */
public class Addition {
    String id;
    String idTable;
    Date date;
    Double prixTotal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdTable() {
        return idTable;
    }

    public void setIdTable(String idTable) {
        this.idTable = idTable;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(Double prixTotal) {
        this.prixTotal = prixTotal;
    }

    public Addition() {
    }

    public Addition(String id, String idTable, Date date, Double prixTotal) {
        this.id = id;
        this.idTable = idTable;
        this.date = date;
        this.prixTotal = prixTotal;
    }

    public Addition(String id, String idTable, Date date) {
        this.id = id;
        this.idTable = idTable;
        this.date = date;
    }
    
    public boolean estLibre(String idTable)throws Exception{
        return true;
    }
    public static void ajouterAddition(String idTable,String idServeur,Connection con)throws Exception{
        String req="INSERT INTO Addition VALUES(default,'"+idTable+"',now())";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
    }
    public Vector<AdditionDetails> getListeDetail(String id)throws Exception{
        Connection con=Connexion.getConnection();
        Vector<AdditionDetails> retour=new Vector();
        String req="SELECT idPlat,nom,idAddition,COUNT(idPlat) as quantite,SUM(prix) as prix FROM plat_AdditionDetails WHERE idAddition='"+id+"' GROUP BY idPlat,nom,idAddition";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new AdditionDetails(res.getString("quantite"),res.getString("idAddition"),res.getString("nom"),res.getDouble("prix")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static String getLast(String idTable)throws Exception{
        String req="select id from Addition where date=(SELECT MAX(date) FROM Addition) and idTable='"+idTable+"'";
        String retour="";
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour=res.getString("id");
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static Vector<Addition> getAll()throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM Addition";
        Vector<Addition> retour=new Vector();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new Addition(res.getString("id"),res.getString("idTable"),res.getDate("date")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public void valider()throws Exception{
        String req="UPDATE AdditionDetails set etat='1' WHERE idAddition='"+this.getId()+"' AND etat='0'";
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        stmt.close();
        con.close();
    }
    public Vector<AdditionDetails> voirListeLivre()throws Exception{
        Connection con=Connexion.getConnection();
        Vector<AdditionDetails> retour=new Vector();
        String req="SELECT idPlat,nom,idAddition,COUNT(idPlat) as quantite,SUM(prix) as prix FROM plat_AdditionDetails WHERE idAddition='"+this.getId()+"' and etat='3' GROUP BY idPlat,nom,idAddition";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new AdditionDetails(res.getString("quantite"),res.getString("idAddition"),res.getString("nom"),res.getDouble("prix")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static Addition getById(String id)throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM Addition WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Addition retour=null;
        while(res.next()){
            retour=new Addition(res.getString("id"),res.getString("idTable"),res.getDate("date"));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static void annuler(String idAddition,String idPlat)throws Exception{
        String req="DELETE FROM AdditionDetails WHERE idAddition='"+idAddition+"' AND idPlat in(SELECT id FROM Plat WHERE descri='"+idPlat+"')";
        System.out.println(req);
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        stmt.close();
        con.close();
    }
    public static Vector<Addition> getAdditionNonPaye()throws Exception{
        String req="SELECT * FROM vue_addition_non_payer";
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Vector<Addition> retour=new Vector();
        while(res.next()){
            retour.add(new Addition(res.getString("id"),res.getString("prix"),res.getDate("date")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
    public static Vector<AdditionDetails> getNonPaye(String idAddition)throws Exception{
        String req="SELECT * FROM AdditionDetails WHERE id NOT IN (SELECT idAdditionDetails FROM Paiement) AND idAddition='"+idAddition+"'";
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Vector<AdditionDetails> retour=new Vector();
        while(res.next()){
            retour.add(new AdditionDetails(res.getString("id"),res.getString("idAddition"),res.getString("idPlat"),res.getDouble("prix")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
}
