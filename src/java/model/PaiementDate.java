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
public class PaiementDate {
    String idTypePaiement;
    String nomTypePaiement;
    double montant;

    public String getIdTypePaiement() {
        return idTypePaiement;
    }

    public void setIdTypePaiement(String idTypePaiement) {
        this.idTypePaiement = idTypePaiement;
    }

    public String getNomTypePaiement() {
        return nomTypePaiement;
    }

    public void setNomTypePaiement(String nomTypePaiement) {
        this.nomTypePaiement = nomTypePaiement;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public PaiementDate() {
    }

    public PaiementDate(String idTypePaiement, String nomTypePaiement, double montant) {
        this.idTypePaiement = idTypePaiement;
        this.nomTypePaiement = nomTypePaiement;
        this.montant = montant;
    }
    
    
}
