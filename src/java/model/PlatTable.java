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
public class PlatTable extends AdditionDetails{
    String idTable;
    String nomTable;

    public String getIdTable() {
        return idTable;
    }

    public void setIdTable(String idTable) {
        this.idTable = idTable;
    }

    public String getNomTable() {
        return nomTable;
    }

    public void setNomTable(String nomTable) {
        this.nomTable = nomTable;
    }

    public PlatTable(String idTable, String nomTable) {
        this.idTable = idTable;
        this.nomTable = nomTable;
    }

    public PlatTable(String idTable, String nomTable, String id, String idAddition, String idPlat, Double prix) {
        super(id, idAddition, idPlat, prix);
        this.idTable = idTable;
        this.nomTable = nomTable;
    }
    
    
}
