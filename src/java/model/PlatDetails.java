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
    Double poids;

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

    public PlatDetails() {
    }

    public PlatDetails(String id, String idPlat, String idIngredient, Double poids) {
        this.id = id;
        this.idPlat = idPlat;
        this.idIngredient = idIngredient;
        this.poids = poids;
    }
    
    
}
