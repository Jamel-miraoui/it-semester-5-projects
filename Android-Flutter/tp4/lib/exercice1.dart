import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int xdd = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr, // or TextDirection.rtl if you need right-to-left.
        child: Scaffold(
          appBar: AppBar(title: Text("MiraouiJamel")),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      xdd++;
                    });
                  },
                  child: Text("click me"),
                ),
                Text("$xdd"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
