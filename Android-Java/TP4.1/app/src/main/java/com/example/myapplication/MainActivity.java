package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements
        View.OnClickListener   {
    EditText name ;
    Button bt1,bt2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout);
        name = (EditText)findViewById(R.id.name);
        bt1 = (Button) findViewById(R.id.bt1);
        bt2 = (Button) findViewById(R.id.bt2);
        bt1.setOnClickListener(this);
        bt2.setOnClickListener(this);
}

    @Override
    public void onClick(View v) {
        if (v.getId()== R.id.bt1) {
            String nn = name.getText().toString();
            Toast.makeText(MainActivity.this, "Welcome: " + nn, Toast.LENGTH_SHORT).show();
        } else if (v.getId()== R.id.bt2) { // Use 'else if' here
            name.setText("");
        }
    }
}