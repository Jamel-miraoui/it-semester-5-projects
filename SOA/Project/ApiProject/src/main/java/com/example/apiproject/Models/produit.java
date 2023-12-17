package com.example.apiproject.Models;

public class produit {
    private int reference ;
    private String name ;
    private int prix ;
    private String ImagePath ;

    public produit(int reference, String name, int prix, String imagePath) {
        this.reference = reference;
        this.name = name;
        this.prix = prix;
        ImagePath = imagePath;
    }
    public produit() {
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
