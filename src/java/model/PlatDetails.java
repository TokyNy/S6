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
public class PlatDetails {
    String id;
    String idPlat;
    String idIngredient;
    double poids;
    double prix;

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

    public double getPoids() {
        return poids;
    }

    public void setPoids(double poids) {
        this.poids = poids;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public PlatDetails() {
    }

    public PlatDetails(String id, String idPlat, String idIngredient, double poids) {
        this.id = id;
        this.idPlat = idPlat;
        this.idIngredient = idIngredient;
        this.poids = poids;
    }

    public PlatDetails(String id, String idPlat, String idIngredient, double poids, double prix) {
        this.id = id;
        this.idPlat = idPlat;
        this.idIngredient = idIngredient;
        this.poids = poids;
        this.prix = prix;
    }
    
    
}
