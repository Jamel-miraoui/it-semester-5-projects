import 'package:flutter/material.dart';
import 'package:tr/Widget/CustomButoon.dart';
import 'package:tr/Widget/CustomCheckbox.dart';
import 'package:tr/Widget/CustomTextField.dart';
import 'package:tr/Widget/Customradio.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final fomrkey = GlobalKey<FormState>();
  bool? checkvaleur,checkvaleur1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("fdfdff"),
        ),
        body: Center(
            child: Form(
          key: fomrkey,
          child: Column(
            children: [
              CustomtextField(
                label: "label",
                Validate: (value) {
                  if ((value == null) || (value.length == 0)) {
                    return "Text Obligatoire";
                  } else
                    return null;
                },
              ),
              CustomCheckbox(
                value: checkvaleur,
                onChanged: (value) {
                  setState(() {
                    checkvaleur = value!;
                  });
                },
              text: "to be rich another time"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButoon(
                    onpressed: () {
                      if (fomrkey.currentState?.validate() ?? false) {
                        print("hell no");
                      }
                    },
                    color: Colors.teal,
                    text: "hello",
                  ),
                  CustomButoon(
                    onpressed: () {
                      if (fomrkey.currentState?.validate() ?? false) {
                        print("hell no");
                      }
                    },
                    color: Colors.teal,
                    text: "if else",
                  ),
                  Customradio(onchanged: (value) {
                    checkvaleur1 = ; 
                  },)
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
