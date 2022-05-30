/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connexion.Connexion;
import java.sql.Connection;
import java.util.Date;
import java.util.Vector;
import java.sql.Statement;
import java.sql.ResultSet;
/**
 *
 * @author ASUS
 */
public class Paiement {
    String id;
    String idAdditionDetail;
    String idTypePaiement;
    double montant;
    Date date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdAdditionDetail() {
        return idAdditionDetail;
    }

    public void setIdAdditionDetail(String idAdditionDetail) {
        this.idAdditionDetail = idAdditionDetail;
    }

    public String getIdTypePaiement() {
        return idTypePaiement;
    }

    public void setIdTypePaiement(String idTypePaiement) {
        this.idTypePaiement = idTypePaiement;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public static Vector<PaiementDate> getMontantPaiement(String date1,String date2)throws Exception{
        Connection con=Connexion.getConnection();
        Vector<PaiementDate> retour=new Vector();
        //String req="SELECT p.idTypePaiement,tp.nom as nomType,SUM(montant) as montant FROM Paiement p join TypePaiement tp on p.idTypePaiement=tp.id WHERE p.date>='"+date1+"' AND p.date2<='"+date2+"' GROUP BY p.idTypePaiement,tp.nom";
        //String sql="SELECT p.idTypePaiement,tp.intitule as nomType,SUM(montant) as montant FROM Paiement p right join TypePaiement tp on p.idTypePaiement=tp.id WHERE";
        String sql="SELECT tp.id as idTypePaiement,tp.intitule as nomType,CASE WHEN SUM(montant) IS NULL THEN 0 ELSE SUM(montant) END montant FROM TypePaiement tp left join Paiement p on p.idTypePaiement=tp.id WHERE ";
        if(date1==null || date1.isEmpty()==true){
            if(date2==null || date2.isEmpty()==true){
                sql+=" date::TIMESTAMP::DATE>=CURRENT_DATE AND";
            }
        }else{
            sql+=" date>='"+date1+"' AND";
        }
        if(date2==null || date2.isEmpty()==true){
            sql+=" date::TIMESTAMP::DATE<=CURRENT_DATE";
        }else{
            sql+=" date<='"+date2+"'";
        }
        sql+=" OR date is null";
        sql+=" GROUP BY tp.id,tp.intitule";
        System.out.println(sql);
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(sql);
        while(res.next()){
            retour.add(new PaiementDate(res.getString("idTypePaiement"),res.getString("nomType"),res.getDouble("montant")));
        }
        res.close();
        stmt.close();
        con.close();
        return retour;
    }

    public static void payer(String idAdditionDetail,String idType,String montant)throws Exception{
        String req="INSERT INTO Paiement VALUES(default,'"+idAdditionDetail+"','"+idType+"',"+montant+",NOW)";
        Connection con=Connexion.getConnection();
        Statement stmt=con.createStatement();
        stmt.executeUpdate(req);
        con.close();
    }
    
    public Paiement() {
    }

    public Paiement(String id, String idAdditionDetail, String idTypePaiement, double montant, Date date) {
        this.id = id;
        this.idAdditionDetail = idAdditionDetail;
        this.idTypePaiement = idTypePaiement;
        this.montant = montant;
        this.date = date;
    }
    
    
}
