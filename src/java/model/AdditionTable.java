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
public class AdditionTable {
    String idAddition;
    String idTable;
    Date date;
    Double prixTotal;

    public String getIdAddition() {
        return idAddition;
    }

    public void setIdAddition(String idAddition) {
        this.idAddition = idAddition;
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

    public AdditionTable() {
    }

    public AdditionTable(String idAddition, String idTable, Date date, Double prixTotal) {
        this.idAddition = idAddition;
        this.idTable = idTable;
        this.date = date;
        this.prixTotal = prixTotal;
    }
    
    public static Vector<AdditionTable> getAll()throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM total_addition_par_table";
        Vector<AdditionTable> retour=new Vector();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new AdditionTable(res.getString("id"),res.getString("idTable"),res.getDate("date"),res.getDouble("prixTotal")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
}
