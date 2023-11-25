package com.example.gestion;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;

public class EtudiantDBHandler extends SQLiteOpenHelper {
// Database Version
    private static final int DATABASE_VERSION = 1;
    // Database Name
    private static final String DATABASE_NAME = "EtudiantDB" ;
    private static final String TableEtudiant = "table_etudiants";
    private static final String COLONNE_id = "id";

    private static final String COLONNE_prenom = "prenom";
    private static final String COLONNE_nom = "nom";
    private static final String COLONNE_classe = "classe";
    private static final String COLONNE_login = "login";
    private static final String COLONNE_password = "password";


    private static final String REQUETE_CREATION_BD = "create table " + TableEtudiant + " (" +
            COLONNE_id + " integer primary key autoincrement, " + COLONNE_prenom + " TEXT not null, " + COLONNE_nom + " TEXT not null, " +  // Added a space after "not null"
            COLONNE_classe + " TEXT not null, " + COLONNE_login + " TEXT not null, " + COLONNE_password + " TEXT not null);";

    public EtudiantDBHandler(Context context, String nom, SQLiteDatabase.CursorFactory cursorfactory, int version) {
        super(context, nom , cursorfactory, version ); }
    public EtudiantDBHandler(Context context) {
        super(context, DATABASE_NAME ,null, DATABASE_VERSION
        ); }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(REQUETE_CREATION_BD);
    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE " + TableEtudiant + ";");
        onCreate(db);
    }
    public void insertEtudiant(Etudiants etudiant) {
        SQLiteDatabase maDB = this.getWritableDatabase();
        ContentValues valeurs = new ContentValues();
        valeurs.put(COLONNE_prenom, etudiant.getPrenom());
        valeurs.put(COLONNE_nom, etudiant.getNom());
        valeurs.put(COLONNE_classe, etudiant.getClasse());
        valeurs.put(COLONNE_login, etudiant.getLogin());
        valeurs.put(COLONNE_password, etudiant.getPassword());
        maDB.insert(TableEtudiant, null, valeurs);
        maDB.close();
    }
    public ArrayList<Etudiants> getAllEtudiants() {
        SQLiteDatabase maDb = this.getWritableDatabase();
        Cursor c = maDb.query(TableEtudiant, new String[]{COLONNE_id, COLONNE_prenom, COLONNE_nom, COLONNE_classe, COLONNE_login, COLONNE_password}, null, null, null, null, null);
        return cursortoEtudiants(c);
    }

    private ArrayList<Etudiants> cursortoEtudiants(Cursor c) {
        if (c.getCount() == 0)
            return new ArrayList<>();

        ArrayList<Etudiants> etudiantList = new ArrayList<>(c.getCount());
        c.moveToFirst();

        do {
            Etudiants etudiant = new Etudiants();
            etudiant.setId(c.getInt(0));
            etudiant.setPrenom(c.getString(1));
            etudiant.setNom(c.getString(2));
            etudiant.setClasse(c.getString(3));
            etudiant.setLogin(c.getString(4));
            etudiant.setPassword(c.getString(5));
            etudiantList.add(etudiant);
        } while (c.moveToNext());
        c.close();
        return etudiantList;
    }

}

