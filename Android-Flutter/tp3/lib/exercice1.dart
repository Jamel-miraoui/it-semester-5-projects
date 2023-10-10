import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    title: "my first app",
    home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("myapp"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('button 1'),
                onPressed: () {
                  print('test1');
                },
              ),
              createIcon(),
              SizedBox(
                height: 80,
                width: 100,
                child: createButton('test test'),
              ), 
              ElevatedButton(
                child: Text('very long button 3'),
                onPressed: () {
                  print('test1');
                },
              ),
            ],
          ),
        )),
  );
  runApp(myApp);
}

Widget createButton(String msg) {
  return ElevatedButton(
                child: Text(msg),
                onPressed: () {
                  print('test1');
                },
              );
}

Widget createIcon() {
  return Icon(Icons.ac_unit,size:60.0, color:Colors.blue);
}