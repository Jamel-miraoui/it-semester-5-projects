import 'dart:js_util';

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
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createButton("B1"),
            SizedBox(
              height: 25,
              width: 120,
              child: Icon(
                Icons.ac_unit,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 80, child: createButton("B2")),
            SizedBox(
              width: 120,
              child: Icon(
                Icons.add_circle_rounded,
                color: Colors.green,
                size: 60,
              ),
            ),
            createButton("Btn 3"),
          ],
        ))),
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
