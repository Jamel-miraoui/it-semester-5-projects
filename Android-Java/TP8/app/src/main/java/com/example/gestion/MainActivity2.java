package com.example.gestion;

import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
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
            TextView Prenom = new TextView(MainActivity2.this);
            Prenom.setTextSize(20);
            Prenom.setText("Prenom = "  + etudiant.getPrenom());
            TextView Nom = new TextView(MainActivity2.this);
            Nom.setTextSize(20);
            TextView Passswoerd = new TextView(MainActivity2.this);
            Button bt = new Button(MainActivity2.this) ;
            bt.setText("appeller");
            bt.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Uri uri = Uri.parse("tel:23690209");
                    Intent intent = new Intent(Intent.ACTION_CALL,uri);
                    startActivity(intent);
                }
            });
            Passswoerd.setTextSize(20);
            Passswoerd.setText("Password = "  + etudiant.getPassword());
            linearLayout.addView(bt);
            linearLayout.addView(Prenom);
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