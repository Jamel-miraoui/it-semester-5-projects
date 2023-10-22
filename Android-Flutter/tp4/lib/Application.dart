import 'package:flutter/material.dart';
void main(){
  runApp(MyApp()); 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Duplicate Picture"),),
        body: Column(
          children: [
            ElevatedButton(onPressed: getIcones, child: Text("hello"))
          ],
        ),
      ),
    );
  }
  Icon getIcones(){
    List<IconData> iconn = [Icons.ac_unit_rounded];
    return Icon(iconn[0],color: Colors.blue,);
  }
}
