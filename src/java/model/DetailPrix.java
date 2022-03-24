/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class DetailPrix extends PlatDetails{
    Double prixMoyen;
    Double prix;

    public Double getPrixMoyen() {
        return prixMoyen;
    }

    public void setPrixMoyen(Double prixMoyen) {
        this.prixMoyen = prixMoyen;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public String getIdIngredient() {
        return idIngredient;
    }

    public void setIdIngredient(String idIngredient) {
        this.idIngredient = idIngredient;
    }

    public Double getPoids() {
        return poids;
    }

    public void setPoids(Double poids) {
        this.poids = poids;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public DetailPrix(Double prixMoyen) {
        this.prixMoyen = prixMoyen;
    }

    public DetailPrix(Double prixMoyen, String id, String idPlat, String idIngredient, Double poids) {
        super(id, idPlat, idIngredient, poids);
        this.prixMoyen = prixMoyen;
    }

    public DetailPrix(Double prixMoyen, Double prix) {
        this.prixMoyen = prixMoyen;
        this.prix = prix;
    }

    public DetailPrix(Double prixMoyen, Double prix, String id, String idPlat, String idIngredient, Double poids) {
        super(id, idPlat, idIngredient, poids);
        this.prixMoyen = prixMoyen;
        this.prix = prix;
    }
    
    
}
