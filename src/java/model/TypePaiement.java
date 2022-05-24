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
 * @author admin
 */
public class TypePaiement {
    String typePaie;
    String intitule;

    public String getTypePaie() {
        return typePaie;
    }

    public void setTypePaie(String typePaie) {
        this.typePaie = typePaie;
    }

    public String getIntitule() {
        return intitule;
    }

    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }
    public TypePaiement[] lister()throws Exception{
        Vector v=new Vector();
        int taille=0;
        Connection con=Connexion.getConnection();
        String req="select * from typePaiement";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            TypePaiement t=new TypePaiement();
            t.setTypePaie(res.getString(1));
            t.setIntitule(res.getString(2));
            v.addElement(t);
            taille++;
        }
        TypePaiement[] tp=new TypePaiement[taille];
        for(int i=0;i<tp.length;i++){
            tp[i]=(TypePaiement)v.get(i);
        }
        return tp;
        
    }
}
