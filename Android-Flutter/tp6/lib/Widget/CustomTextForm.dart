import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  
  const CustomTextForm({super.key,
  this.typpe,
  this.label="",
  this.hint="",
  this.uneIcon,
  this.valider, 
  this.saved});

  @override
  final TextInputType? typpe;
  final String label;
  final String hint;
  final IconData? uneIcon;
  final String? Function(String?)? valider;
  final String? Function(String?)? saved;
  @override
  Widget build(BuildContext context) {
    
    return TextEmail();
  }

   Widget TextEmail()
  {
    return TextFormField(keyboardType:typpe,
    decoration: InputDecoration
    (border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.00)),prefixIcon:Icon(uneIcon)
    ,label:Text(label),hintText: hint,prefixIconColor: Colors.blue,),
    validator: valider,onSaved: saved,
   
   
    );
  

  }
}