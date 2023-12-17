package com.example.apiproject.Models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;



@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer"})
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int reference;
    @NotBlank
    private String name;

    private int prix ;
    @NotBlank
    private String ImagePath ;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    public Produit(int reference, String name, int prix, String imagePath, User user) {
        this.reference = reference;
        this.name = name;
        this.prix = prix;
        this.ImagePath = imagePath;
        this.user = user;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
