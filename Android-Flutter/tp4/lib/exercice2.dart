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
        backgroundColor: colors[i],
        appBar: AppBar(title: Text("test"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:(){
                setState(() {
                  if( i < colors.length - 1 ){i++;}else{i=0;}
                });
              }, child: Text("Change the color"))
            ],
          ),
        ),
      ),
    );
  }
}

