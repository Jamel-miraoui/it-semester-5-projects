package com.example.apiproject.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;



@Entity
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int reference;
    @NotBlank
    private String name;
    @NotBlank
    private int prix ;
    @NotBlank
    private String ImagePath ;

    public Produit(User user,int reference, String name, int prix, String imagePath) {
        this.reference = reference;
        this.name = name;
        this.prix = prix;
        ImagePath = imagePath;
    }
    public Produit() {
    }

    public int getReference() {
        return reference;
    }

    public void setReference(int reference) {
        this.reference = reference;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public String getImagePath() {
        return ImagePath;
    }

    public void setImagePath(String imagePath) {
        ImagePath = imagePath;
    }
}
