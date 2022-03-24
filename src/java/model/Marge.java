/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author ACER
 */
public class Marge {
    Double min;
    Double max;
    Double prix;

    public Double getMin() {
        return min;
    }

    public void setMin(Double min) {
        this.min = min;
    }

    public Double getMax() {
        return max;
    }

    public void setMax(Double max) {
        this.max = max;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Marge(Double min, Double max, Double prix) {
        this.min = min;
        this.max = max;
        this.prix = prix;
    }

    public Marge() {
    }
    
    public Vector<Marge> getListeMarge(Connection con)throws Exception{
        Vector<Marge> vec=new Vector();
        String req="SELECT * FORM marge";
         Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Marge m=new Marge();
            m.setMin(res.getDouble("min"));
            m.setMax(res.getDouble("max"));
            m.setPrix(res.getDouble("pourcentage"));
            vec.addElement(m);
        }
        return vec;
    }
    
    
}
