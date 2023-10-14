package com.example.tp21;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);
        EditText prenom  = (EditText)findViewById(R.id.prenom) ;
        EditText nom  = (EditText)findViewById(R.id.nom) ;
        EditText classe  = (EditText)findViewById(R.id.classe) ;
        EditText group  = (EditText)findViewById(R.id.group) ;
        EditText matricuile  = (EditText)findViewById(R.id.matricuile) ;
        prenom.setText("jamel");
        nom.setText("miraoui");
        classe.setText("dsi3.1");
        group.setText("2");
        matricuile.setText("856215315213");
    }
}