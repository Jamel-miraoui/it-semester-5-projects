import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student/Database/DatabaseHelper.dart';
import 'package:student/Entity/Student.dart';
import 'package:student/Widget/CustomButton.dart';
import 'package:student/Widget/CustomTextForm.dart';

class From extends StatefulWidget {
  const From({super.key});

  @override
  State<From> createState() => _FromState();
}

class _FromState extends State<From> {
  DataBaseHelper db = DataBaseHelper.instance;  
  final keyForm = GlobalKey<FormState>() ; 
  Student student = Student();
  String? name , age , id ; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("help")),
        body: Center(
          child: Column(
            children: [
              Form(
                key: keyForm,
                child: Column(
                children: [
                  CustomTextForm(label: "Name",hint: "Enter the Name here",saved: (value) {
                    student.name = value! ; 
                  },) ,
                  CustomTextForm(label: "Age" ,saved: (value) {
                    student.age = 22 ;
                  },),
                  CustomTextForm(label: "Id",typeClavier: TextInputType.number,
                  saved: (value) {
                    student.studentId =  "26" ; 
                    student.id = 22 ; 
                  },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBouton(onpressed: () {
                        if(keyForm.currentState?.validate() ?? false){
                          keyForm.currentState!.save();
                           print(student.toString()) ; 
                           db.addStudent(student);
                        }
                      },text: "Save",) , 
                      Padding(padding: EdgeInsets.all(8.0)),
                      CustomBouton(onpressed: () {
                        keyForm.currentState!.reset(); 
                      },text: "Reset",)
                    ],
                  )
                ],
              )
              ),
              Column(
                children: [
                   
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
