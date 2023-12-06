import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    Key? key , 
    this.label= "" , 
    this.hint,
    this.Validate , 
    this.InputType 
     
    })
    :super(key: key) ; 


  final TextInputType? InputType ;
  final String label ; 
  final String? hint ; 
  final String? Function(String?)? Validate ; 

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: InputType,
      decoration: InputDecoration(
        label: Text(label) , 
        hintText: hint , 
        hintStyle: TextStyle(
          fontSize: 30
        ),
        fillColor: Colors.yellow.withOpacity(0.2) , 
         filled: true ,
         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
         prefixIcon:Icon(Icons.accessibility_new_sharp), 
         iconColor: Colors.indigoAccent, 
      ),
      validator: Validate,
    );
  }
}