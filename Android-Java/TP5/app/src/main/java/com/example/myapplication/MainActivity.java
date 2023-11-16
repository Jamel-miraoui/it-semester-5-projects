package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    double result1,montant1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);
        EditText montant =(EditText)findViewById(R.id.montant);
        RadioButton r1 = (RadioButton)findViewById(R.id.r1);
        RadioButton r2 = (RadioButton)findViewById(R.id.r2);
        RadioButton r3 = (RadioButton)findViewById(R.id.r3);
        RadioButton r4 = (RadioButton)findViewById(R.id.r4);
        TextView result = (TextView)findViewById(R.id.result) ;
        Button bt1 =(Button)findViewById(R.id.bt1);
        Button bt2 =(Button)findViewById(R.id.bt2);
        bt2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                montant.setText("");
                result.setText("");
                if(r1.isChecked()){r1.setChecked(false);}
                if(r2.isChecked()){r2.setChecked(false);}
                if(r3.isChecked()){r3.setChecked(false);}
                if(r4.isChecked()){r4.setChecked(false);}

            }
        });

        bt1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    montant1 = Float.parseFloat(String.valueOf(montant.getText()));
                } catch (Exception e) {
                    Toast.makeText(MainActivity.this, "Pls enter a valide Number",Toast.LENGTH_SHORT).show();
                    montant1 = 0.0;
                }
                if ( montant1 != 0.0){
                    if(r1.isChecked()){
                        result1 = montant1 / 3.2 ;
                        result.setText(result1+ " Euro");
                    }
                    else if(r2.isChecked()){
                        result1 = montant1 / 2.9 ;
                        result.setText(result1+ " USD");
                    }
                    else if(r3.isChecked()){
                        result1 = montant1 * 3.2 ;
                        result.setText(result1+ " Dt");
                    }
                    else if(r4.isChecked()){
                        result1 = montant1 * 2.9 ;
                        result.setText(result1+ " Dt");
                    } else {Toast.makeText(MainActivity.this, "Pls check a radio button",Toast.LENGTH_SHORT).show();}
                }
            }
        });
    }

}

