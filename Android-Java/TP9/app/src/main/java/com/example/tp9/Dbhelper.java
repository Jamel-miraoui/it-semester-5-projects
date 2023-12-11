package com.example.tp9;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.ArrayList;

public class Dbhelper extends SQLiteOpenHelper {
    private static final int DATABASE_VERSION = 1;
    private static final String DATABASE_NAME = "Phone" ;
    private static final String TableEtudiant = "TAblephone";
    private static final String COLONNE_id = "id";

    private static final String COLONNE_name = "name";
    private static final String COLONNE_number = "number";


    private static final String REQUETE_CREATION_BD = "create table " + TableEtudiant + " (" +
            COLONNE_id + " integer primary key autoincrement, " + COLONNE_name + " TEXT not null, " + COLONNE_number + " TEXT not null" +  ");";

    public Dbhelper(Context context, String nom, SQLiteDatabase.CursorFactory cursorfactory, int version) {
        super(context, nom , cursorfactory, version ); }
    public Dbhelper(Context context) {
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
    public void insertEtudiant(user user) {
        SQLiteDatabase maDB = this.getWritableDatabase();
        ContentValues valeurs = new ContentValues();
        valeurs.put(COLONNE_name, user.getId());
        valeurs.put(COLONNE_number, user.getNumber());
        maDB.insert(TableEtudiant, null, valeurs);
        maDB.close();
    }
    public ArrayList<user> getAllEtudiants() {
        SQLiteDatabase maDb = this.getWritableDatabase();
        Cursor c = maDb.query(TableEtudiant, new String[]{COLONNE_id, COLONNE_name, COLONNE_number}, null, null, null, null, null);
        return cursortoEtudiants(c);
    }

    private ArrayList<user> cursortoEtudiants(Cursor c) {
        if (c.getCount() == 0)
            return new ArrayList<>();
        ArrayList<user> etudiantList = new ArrayList<>(c.getCount());
        c.moveToFirst();
        do {
            user etudiant = new user();
            etudiant.setId(c.getString(1));
            etudiant.setNumber(c.getString(2));
            etudiantList.add(etudiant);
        } while (c.moveToNext());
        c.close();
        return etudiantList;
    }

}
