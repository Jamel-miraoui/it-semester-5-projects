import 'package:flutter/material.dart';
import 'package:test/Form/CustomCheckBox.dart';

import 'CustomTextField.dart';

void main() {
  runApp(test());
}

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final keytajribi = GlobalKey<FormState>();
  bool value1 = false ; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: keytajribi,
          child: Column(
          children: [
            CustomTextField(label:"this is the second test",validation:(value){
              if(value?.length == 3 ){return "kahwalkao" ; }else return null ; 
            }),
            CustomCheckBox(msg: "test ",value: value1,onchanged: (value){
              setState(() {
                value1 = !value1;
              });
            },
             ), 
            ElevatedButton(onPressed: (){
              if(keytajribi.currentState!.validate()){ print("S7i7"); } else  {print("moch s7i7");}  ; 
            }, child: Text("click me"))
          ]
        )),
      ),
    ));
  }
}
