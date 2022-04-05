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
public class Cuisine {
    public static Vector<AdditionDetails> getListeCommande()throws Exception{
        Connection con=Connexion.getConnection();
        String req="SELECT * FROM vue_plat_commande";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Vector<AdditionDetails> retour=new Vector();
        while(res.next()){
            retour.add(new AdditionDetails(res.getString("id"),res.getString("idAddition"),res.getString("nomplat"),res.getDouble("prix")));
        }
        con.close();
        return retour;
    }
}
