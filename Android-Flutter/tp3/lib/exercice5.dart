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
              IconButton(
                onPressed: () {
                  print('test1');
                },
                icon: Icon(Icons.thumb_up, color: Colors.blue),
              ),
              Text("0", style: TextStyle(color: Colors.blue.shade200, fontSize: 30)),
              IconButton(
                onPressed: () {
                  print('test1');
                },
                icon: Icon(Icons.thumb_down, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
