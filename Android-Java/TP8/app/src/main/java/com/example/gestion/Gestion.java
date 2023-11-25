package com.example.gestion;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.util.ArrayList;

public class Gestion extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.gestion);
        Button btn = (Button)findViewById(R.id.btn) ;
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent;
                intent = new Intent(Gestion.this,inscription.class);
                startActivityForResult(intent,1);
            }
        });
    }

    public void onActivityResult(int requestCode, int resultCode,Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case (1):
                switch (resultCode) {
                    case RESULT_CANCELED:
                        Toast.makeText(this, "Inscription anuller", Toast.LENGTH_SHORT).show();
                        EtudiantDBHandler etudiant = new EtudiantDBHandler(Gestion.this) ;
                        ArrayList<Etudiants> var =  etudiant.getAllEtudiants() ;
                        ArrayList<String> str= new ArrayList<>()  ;
                        for (Etudiants etd : var) {
                            str.add(etd.getNom());
                        }
                        Toast.makeText(this, "names : " +str.toString(), Toast.LENGTH_SHORT).show();
                        return;
                    case RESULT_OK:
                        Toast.makeText(this, "Inscription Done", Toast.LENGTH_SHORT).show();
                }

        }// switch
    }
}