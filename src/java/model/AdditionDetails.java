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
public class AdditionDetails {
    String id;
    String idAddition;
    String idPlat;
    Double prix;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdAddition() {
        return idAddition;
    }

    public void setIdAddition(String idAddition) {
        this.idAddition = idAddition;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public AdditionDetails() {
    }

    public AdditionDetails(String id, String idAddition, String idPlat, Double prix) {
        this.id = id;
        this.idAddition = idAddition;
        this.idPlat = idPlat;
        this.prix = prix;
    }
    
    
}
