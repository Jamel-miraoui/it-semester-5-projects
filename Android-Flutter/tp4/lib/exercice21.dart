import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp()) ; 
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Color> colors = [Colors.red, Colors.blue, Colors.black ,
    Colors.brown,Colors.pink , Colors.yellow , Colors.purple , Colors.cyan, Colors.orange];
  var i = 0 ; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("test"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:(){
                setState(() {
                  i = Random().nextInt(8);
                });
              }, child: Text("Change the color")) , 
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: 200,
                width: 200,
                color:Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(256))  //colors[i]
              )
            ],
          ),
        ),
      ),
    );
  }
}


