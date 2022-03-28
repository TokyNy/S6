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
    
    public boolean estLibre(String idTable)throws Exception{
        return true;
    }
    public static void ajouterAddition(String idTable,String idServeur,Connection con)throws Exception{
        String req="INSERT INTO Addition VALUES(default,'"+idTable+"',now())";
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
    }
    public Vector<AdditionDetails> getListeDetail()throws Exception{
        Connection con=Connexion.getConnection();
        Vector<AdditionDetails> retour=new Vector();
        String req="SELECT * FROM plat_AdditionDetails WHERE idAddition='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new AdditionDetails(res.getString("idAdditionDetails"),res.getString("idAddition"),res.getString("nom"),res.getDouble("prix")));
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
}
