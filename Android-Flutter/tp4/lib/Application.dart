import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<IconData> iconn = [
    Icons.ac_unit_rounded,
    Icons.account_tree_outlined,
    Icons.add_ic_call_rounded,
    Icons.adb_sharp
  ];
  List<Icon> iconlist = [];
  List<String> image = [
    "/home/jamel/Documents/406-Not-Acceptable-IT-Semester-5/Android-Flutter/tp4/lib/assets/image/a3051745-c759-4065-bea6-8f9d2fcd5b20-120_x_178.png",
    "/home/jamel/Documents/406-Not-Acceptable-IT-Semester-5/Android-Flutter/tp4/lib/assets/image/test.png"
  ];
  List<Widget> img =[] ;
  var i = 0;
  var code = 200;
  var code1 = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Duplicate Picture"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    img.add(imagee()) ; 
                    i = Random().nextInt(4);
                    iconlist.add(Icon(iconn[i]));
                    code = Random().nextInt(400);
                    code1 = Random().nextInt(2);
                    
                  });
                },
                child: Text("hello")),
            Padding(padding: EdgeInsets.all(10)),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.cyan,
                  child: Image.asset(image[code1], fit: BoxFit.cover),
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.cyan,
                  child: Image.network('https://picsum.photos/$code',
                      fit: BoxFit.cover),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
            Row(
              children: ,
            ),)
          ],
        ),
      ),
    );
  }
Widget imagee() { 
    return (Container(
      height: 200,
                  width: 200,
                  color: Colors.cyan,
                  child: Image.network('https://picsum.photos/$code',
                      fit: BoxFit.cover),
    )) ;
  }
}