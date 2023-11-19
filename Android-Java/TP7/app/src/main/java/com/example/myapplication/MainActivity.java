package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.widget.Toast;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);
        Button b1 = (Button)findViewById(R.id.b1) ;
        Button b2 = (Button)findViewById(R.id.b2) ;

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent;
                intent = new Intent(MainActivity.this,MainActivity1.class);
                startActivityForResult(intent,1);
            }
        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent;
                intent = new Intent(MainActivity.this,MainActivity2.class);
                startActivityForResult(intent,2);
            }
        });
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode,Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case (1):
                switch (resultCode) {
                    case RESULT_OK:
                        Toast.makeText(this, "Enfant1 OK", Toast.LENGTH_SHORT).show();
                        return;
                    case RESULT_CANCELED:
                        Toast.makeText(this, "Enfant1 Annuler", Toast.LENGTH_SHORT).show();
                        return;
                }
            case (2):
                switch (resultCode) {
                    case RESULT_OK:
                        Toast.makeText(this, "Enfant2 OK", Toast.LENGTH_SHORT).show();
                        return;
                    case RESULT_CANCELED:
                        Toast.makeText(this, "Enfant2 Annuler", Toast.LENGTH_SHORT).show();
                        return;
                }

        }// switch
    }

}