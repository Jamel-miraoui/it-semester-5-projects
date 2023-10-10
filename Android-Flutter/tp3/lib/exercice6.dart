import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    title: "my first app",
    home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("myapp"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(8, (index) {
            return crtlist(index);
          }),
      ),
        ),
  );
  runApp(myApp);
}

Widget crtlist(int number) {
  number = number +1  ; 
  return Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Item $number ',
                ),
              ),
            );
}
