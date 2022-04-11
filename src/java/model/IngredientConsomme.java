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
public class IngredientConsomme extends Ingredients{
    double prix;
    double prixTotal;

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public double getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(double prixTotal) {
        this.prixTotal = prixTotal;
    }

    public IngredientConsomme(double prix, double prixTotal) {
        this.prix = prix;
        this.prixTotal = prixTotal;
    }

    public IngredientConsomme(double prix, double prixTotal, String id, String desc) {
        super(id, desc);
        this.prix = prix;
        this.prixTotal = prixTotal;
    }

    public IngredientConsomme(double prix, double prixTotal, String id, String desc, double poids) {
        super(id, desc, poids);
        this.prix = prix;
        this.prixTotal = prixTotal;
    }
    
    
}
