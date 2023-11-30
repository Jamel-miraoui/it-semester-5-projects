package com.example.gestion;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class inscription extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.inscription);

        EditText prenom = (EditText)findViewById(R.id.prenom);
        EditText nom = (EditText)findViewById(R.id.nom);
        EditText classe = (EditText)findViewById(R.id.classe);
        EditText login = (EditText)findViewById(R.id.login);
        EditText password = (EditText)findViewById(R.id.password);
        Button btnInscri = (Button)findViewById(R.id.inscription) ;
        Button btnAnnuler = (Button)findViewById(R.id.annuler) ;

        btnAnnuler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setResult(RESULT_CANCELED);
                finish();
            }
        });

        btnInscri.setOnClickListener(new View.OnClickListener() {
            boolean stat = true ;
            @Override
            public void onClick(View v) {
                try {
                    EtudiantDBHandler db  = new EtudiantDBHandler(inscription.this) ;
                    db.insertEtudiant(new Etudiants(prenom.getText().toString(),nom.getText().toString(),classe.getText().toString(),login.getText().toString(),password.getText().toString()));
                }
                catch (Exception e ) {
                    stat = false ;
                }
                if (stat) {
                    setResult(RESULT_OK);
                    finish();
                }
            }
        });
    }
}