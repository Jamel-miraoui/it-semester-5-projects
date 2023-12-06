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
        Button btn = (Button)findViewById(R.id.btn1) ;
        Button btn2 = (Button)findViewById(R.id.btn2) ;
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent;
                intent = new Intent(Gestion.this,inscription.class);
                startActivityForResult(intent,1);
            }
        });
        btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent;
                intent = new Intent(Gestion.this,MainActivity2.class);
                startActivityForResult(intent,2);
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
                        return;
                    case RESULT_OK:
                        String result=data.getStringExtra("result");
                        Toast.makeText(this, "Inscription de" + result  + "Done", Toast.LENGTH_SHORT).show();
                }
            case (2):
                switch (resultCode){
                    case RESULT_OK:
                        Toast.makeText(this, "cansulter anuller", Toast.LENGTH_SHORT).show();
                }
        }// switch
    }
}