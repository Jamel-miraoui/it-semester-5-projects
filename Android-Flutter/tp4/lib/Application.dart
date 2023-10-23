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
  List<IconData> iconn = [Icons.ac_unit_rounded,Icons.account_tree_outlined,Icons.add_ic_call_rounded];
  List<Icon> iconlist = [];
  var i = 0  ; 
  var image = '' ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Duplicate Picture"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                if ( i < iconn.length - 1 ){i++;}else{i=0;};
                iconlist.add(Icon(iconn[i])) ; 
                image = 'lib/assets/image/a3051745-c759-4065-bea6-8f9d2fcd5b20-120_x_178.png' ; 
              });
            }, child: Text("hello")),
             Row(
              children:iconlist,
             ) , 
             Container(
              width: 100,
              height: 100,
              decoration: 
              BoxDecoration(image: DecorationImage(image: AssetImage(image)))
             )
          ],
        ),
      ),
    );
  }
}
