import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('jamel miraoui'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Icon(Icons.add_box,color: Colors.white,),
                onPressed: () {
                  print('test1');
                },
              ),
              Text("0",style: TextStyle(color: Colors.red ,fontSize: 30)),
              ElevatedButton(
                child: Icon(Icons.minimize,color :  Colors.white,),
                onPressed: () {
                  print('test1');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
