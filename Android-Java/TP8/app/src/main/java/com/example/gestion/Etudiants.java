package com.example.gestion;

import android.text.Editable;

public class Etudiants {
    int id ;
    String prenom ;
    String nom ;
    String classe ;
    String login ;
    String password;

    public Etudiants(String prenom, String nom, String classe, String login, String password) {
        this.prenom = prenom;
        this.nom = nom;
        this.classe = classe;
        this.login = login;
        this.password = password;
    }

    public Etudiants() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
