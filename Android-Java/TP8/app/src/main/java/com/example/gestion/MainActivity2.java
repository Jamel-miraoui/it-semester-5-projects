package com.example.gestion;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity2 extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.etdlist);
        LinearLayout parentLayout = findViewById(R.id.parent);
        EtudiantDBHandler DB = new EtudiantDBHandler(MainActivity2.this) ;
        ArrayList<Etudiants> AllEtudiants =  DB.getAllEtudiants();
        for (Etudiants etudiant: AllEtudiants) {
            LinearLayout linearLayout = new LinearLayout(MainActivity2.this);
            TextView Id = new TextView(MainActivity2.this);
            Id.setTextSize(20);
            Id.setText("ID = "  + etudiant.getId());
            TextView Prenom = new TextView(MainActivity2.this);
            Prenom.setTextSize(20);
            Prenom.setText("Prenom = "  + etudiant.getPrenom());
            TextView Nom = new TextView(MainActivity2.this);
            Nom.setTextSize(20);
            Nom.setText("Nom = "  + etudiant.getNom());
            TextView Classe = new TextView(MainActivity2.this);
            Classe.setTextSize(20);
            Classe.setText("Classe = "  + etudiant.getClasse());
            TextView login = new TextView(MainActivity2.this);
            login.setTextSize(20);
            login.setText("Login = "  + etudiant.getLogin());
            TextView Passswoerd = new TextView(MainActivity2.this);
            Passswoerd.setTextSize(20);
            Passswoerd.setText("Password = "  + etudiant.getPassword());
            linearLayout.addView(Id);
            linearLayout.addView(Prenom);
            linearLayout.addView(Nom);
            linearLayout.addView(Classe);
            linearLayout.addView(login);
            linearLayout.addView(Passswoerd);
            linearLayout.setOrientation(LinearLayout.VERTICAL);
            linearLayout.setGravity(1);
            linearLayout.setPadding(0,0,0,100);
            parentLayout.addView(linearLayout);
        }
        Button annuler = (Button)findViewById(R.id.anuller);
        annuler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setResult(RESULT_OK);
                finish();
            }
        });

    }
}