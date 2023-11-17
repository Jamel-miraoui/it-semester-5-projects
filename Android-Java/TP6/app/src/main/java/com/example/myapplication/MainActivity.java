package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DecimalFormat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);

        EditText tx1 = (EditText)findViewById(R.id.tx1);
        EditText tx2 = (EditText)findViewById(R.id.tx2);

        RadioButton r1  = (RadioButton)findViewById(R.id.r1);
        RadioButton r2  = (RadioButton)findViewById(R.id.r2);
        RadioButton r3  = (RadioButton)findViewById(R.id.r3);
        RadioButton r4  = (RadioButton)findViewById(R.id.r4);

        TextView result = (TextView)findViewById(R.id.result) ;

        Button bt = (Button)findViewById(R.id.bt);
        bt.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                double valeur1 = 0, valeur2 = 0 , re = 0  ;
                boolean stat = true;
                try {
                    valeur1 = Float.parseFloat(String.valueOf(tx1.getText()));
                    valeur2 = Float.parseFloat(String.valueOf(tx2.getText()));
                }
                catch (Exception e)
                {
                    Toast.makeText(MainActivity.this, "Pls enter 2 valide value",Toast.LENGTH_SHORT).show();
                    result.setText("");
                    stat = false ; }

                if(stat) {
                    DecimalFormat df = new DecimalFormat("0.00");
                    if(r1.isChecked()){
                        re = valeur1 + valeur2 ;
                    }
                    if(r2.isChecked()){
                        re = valeur1 - valeur2 ;
                    }
                    if(r3.isChecked()){
                        re = valeur1 / valeur2 ;
                    }
                    if(r4.isChecked()){
                        re = valeur1 * valeur2 ;
                    }
                    result.setText(" " + df.format(re).toString());
                }
            }

        });
    }
}