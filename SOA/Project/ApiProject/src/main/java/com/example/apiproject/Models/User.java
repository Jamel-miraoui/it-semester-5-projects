package com.example.apiproject.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.List;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer"})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId ;
    @NotBlank
    private String fullName ;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Produit> produits;

    public User(int userId, String fullName, List<Produit> produits) {
        this.userId = userId;
        this.fullName = fullName;
        this.produits = produits;
    }

    public User() {

    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public List<Produit> getProduits() {
        return produits;
    }

    public void setProduits(List<Produit> produits) {
        this.produits = produits;
    }
}
