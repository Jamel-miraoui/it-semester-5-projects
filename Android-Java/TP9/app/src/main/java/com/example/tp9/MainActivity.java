package com.example.tp9;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);
        Button bt = (Button)findViewById(R.id.add) ;
        EditText e1 = (EditText)findViewById(R.id.t1);
        EditText e2 = (EditText)findViewById(R.id.t2);
        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Dbhelper bd = new Dbhelper(MainActivity.this);
                String name = String.valueOf(e1.getText());
                user User = new user(String.valueOf(e1.getText()),String.valueOf(e2.getText()));
                bd.insertEtudiant(User);
            }
        });
    }
}