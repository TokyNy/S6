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
public class Table {
    String id;
    String desc;

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

    public Table() {
    }

    public Table(String id, String desc) {
        this.id = id;
        this.desc = desc;
    }
    
    public static Vector<Table> getAll()throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM TTable";
        Vector<Table> retour=new Vector();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            retour.add(new Table(res.getString("id"),res.getString("descri")));
        }
        con.close();
        return retour;
    }
    
}
