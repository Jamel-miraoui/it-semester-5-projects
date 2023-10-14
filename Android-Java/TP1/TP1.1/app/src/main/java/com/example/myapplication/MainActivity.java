package com.example.myapplication;

import static android.view.Gravity.CENTER;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Gravity;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toolbar;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);

      LinearLayout aa= new LinearLayout(this);



        LinearLayout prenoml= new LinearLayout(this);
        TextView prenom = new TextView(this);
        prenom.setText("Prenom :");
        EditText prenomt = new EditText(this);
        prenomt.setWidth(350);
        prenom.setTextSize(20);
        prenoml.addView(prenom);
        prenoml.addView(prenomt);
        prenoml.setOrientation(LinearLayout.HORIZONTAL);
        aa.addView(prenoml);

        LinearLayout noml= new LinearLayout(this);
        TextView nom = new TextView(this);
        nom.setText("Nom :");
        EditText nomt = new EditText(this);
        nomt.setWidth(350);
        nom.setTextSize(20);
        noml.addView(nom);
        noml.addView(nomt);
        noml.setOrientation(LinearLayout.HORIZONTAL);
        aa.addView(noml);

        LinearLayout classel= new LinearLayout(this);
        TextView classe = new TextView(this);
        classe.setText("Classe :");
        EditText classet = new EditText(this);
        classet.setWidth(350);
        classe.setTextSize(20);
        classel.addView(classe);
        classel.addView(classet);
        classel.setOrientation(LinearLayout.HORIZONTAL);
        aa.addView(classel);

        LinearLayout groupl= new LinearLayout(this);
        TextView group = new TextView(this);
        group.setText("Group :");
        EditText groupt = new EditText(this);
        groupt.setWidth(350);
        group.setTextSize(20);
        groupl.addView(group);
        groupl.addView(groupt);
        groupl.setOrientation(LinearLayout.HORIZONTAL);
        aa.addView(groupl);

        LinearLayout CINl= new LinearLayout(this);
        TextView CIN = new TextView(this);
        CIN.setText("Matricule :");
        EditText CINt = new EditText(this);
        CINt.setWidth(350);
        CIN.setTextSize(20);
        CINl.addView(CIN);
        CINl.addView(CINt);
        CINl.setOrientation(LinearLayout.HORIZONTAL);

        aa.addView(CINl);

        LinearLayout btl= new LinearLayout(this);
        Button bt1 = new Button(this);
        bt1.setText("inscri");
        Button bt2 = new Button(this);
        bt2.setText("anuuler");
        btl.addView(bt1);
        btl.addView(bt2);
        btl.setOrientation(LinearLayout.HORIZONTAL);
        aa.addView(btl);


        aa.setOrientation(LinearLayout.VERTICAL);
        aa.setGravity(Gravity.CENTER);
        setContentView(aa);

    }
}