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
 * @author ASUS
 */
public class Plat {
    String id;
    String desc;
    Double prix;
    String idCategorie;

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

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public String getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(String idCategorie) {
        this.idCategorie = idCategorie;
    }

    public Plat() {
    }

    public Plat(String id, String desc, Double prix) {
        this.id = id;
        this.desc = desc;
        this.prix = prix;
    }

    public Plat(String id, String desc, Double prix, String idCategorie) {
        this.id = id;
        this.desc = desc;
        this.prix = prix;
        this.idCategorie = idCategorie;
    }
    
    public Vector<Ingredients> getListeIngredients(Connection con)throws Exception{
        Vector<Ingredients> retour=new Vector();
        String req="SELECT i.id,i.descri,pd.poids FROM Ingredients i join PlatDetails pd on i.id=pd.idIngredient WHERE pd.idPlat='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Ingredients i=new Ingredients(res.getString("id"),res.getString("descri"),res.getDouble("poids"));
            retour.add(i);
        }
        return retour;
    }
    
    public Vector<PlatDetails> getListeDetail(Connection con)throws Exception{
        Vector<PlatDetails> retour=new Vector();
        String req="SELECT pd.*,pm.prix_moyen FROM PlatDetails pd join vue_prix_moyen pm on pm.idIngredient=pd.idIngredient WHERE idPlat='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            PlatDetails pd=new PlatDetails(res.getString("id"),res.getString("idPlat"),res.getString("idIngredient"),res.getDouble("poids"),res.getDouble("prix_moyen"));
            retour.add(pd);
        }
        return retour;
    }
    public Vector<DetailPrix> getDetailPrix(Connection con)throws Exception{
        Vector<DetailPrix> retour=new Vector();
        String req="SELECT * FROM PlatDetails WHERE idPlat='"+this.getId()+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            DetailPrix pd=new DetailPrix(res.getDouble("prix_moyen"),res.getDouble("prix"),res.getString("id"),res.getString("idPlat"),res.getString("idIngredient"),res.getDouble("poids"));
            retour.add(pd);
        }
        return retour;
    }
    public static Vector<Plat> getAll(Connection con)throws Exception{
        Vector<Plat> retour=new Vector();
        String req="SELECT * FROM Plat";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Plat i=new Plat(res.getString("id"),res.getString("descri"),res.getDouble("prix"));
            retour.add(i);
        }
        return retour;
    }
    public static Vector<Plat> getByIdCategorie(String idCategorie,Connection con)throws Exception{
        Vector<Plat> retour=new Vector();
        String req="SELECT * FROM Plat WHERE idCategorie='"+idCategorie+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        while(res.next()){
            Plat i=new Plat(res.getString("id"),res.getString("descri"),res.getDouble("prix"),res.getString("idCategorie"));
            retour.add(i);
        }
        return retour;
    }
    public static Plat getById(String id,Connection con)throws Exception{
        String req="SELECT * FROM Plat WHERE id='"+id+"'";
        Statement stmt=con.createStatement();
        ResultSet res=stmt.executeQuery(req);
        Plat retour=null;
        while(res.next()){
            retour=new Plat(res.getString("id"),res.getString("descri"),res.getDouble("prix"),res.getString("idCategorie"));
        }
        return retour;
    }
    public double getPrixDeRevient(Connection con)throws Exception{
        Vector<PlatDetails> details=getListeDetail(con);
        double retour=0.0;
        for(int i=0;i<details.size();i++){
            PlatDetails pd=(PlatDetails)details.get(i);
            Ingredients ing=Ingredients.getById(pd.getIdIngredient(),con);
            retour+=ing.getPrixMoyen(con)*pd.getPoids();
        }
        return Math.round(retour);
    }
    public static double calculPixVente(Vector<Marge> listeMarge,double prixRevient){
        double retour=prixRevient;
        for(int i=0;i<listeMarge.size();i++){
            Marge m=(Marge)listeMarge.get(i);
            if(m.getMin()<=prixRevient && m.getMax()>=prixRevient){
                retour=prixRevient+(prixRevient*m.getPrix())/100;
                break;
            }else if(m.getMin()<=prixRevient && m.getMax()==null){
                retour=prixRevient+(prixRevient*m.getPrix())/100;
                break;
            }else if(m.getMax()>=prixRevient && m.getMin()==null){
                retour=prixRevient+(prixRevient*m.getPrix())/100;
                break;
            }
        }
        return retour;
    }
    public void changerStock(Connection con)throws Exception{
        Vector<PlatDetails> liste=this.getListeDetail(con);
        for(int i=0;i<liste.size();i++){
            Stock.insert(liste.get(i).getIdIngredient(), liste.get(i).getPoids(), 0, liste.get(i).getPrix(), con);
        }
    }
}
