import 'package:flutter/material.dart';

void main() {
  var MyApp = MaterialApp(
    title: "my first app",
    home: Scaffold(
      appBar: AppBar(
        title: Text("myapp"),
        backgroundColor: Color.fromARGB(255, 69, 90, 209),
        centerTitle: true,
      ),
    ),
  );
  runApp(MyApp);
}