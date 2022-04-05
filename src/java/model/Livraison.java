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
public class Livraison {
    public static Vector<PlatTable> getListeFini()throws Exception{
        String req="SELECT * FROM vue_plat_preparer";
        Vector<PlatTable> retour=new Vector();
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            PlatTable p=new PlatTable(res.getString("idTable"),res.getString("descri"),res.getString("id"),res.getString("idAddition"),res.getString("nomPlat"),res.getDouble("prix"));
            retour.add(p);
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }
}
