import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField ({
    Key? key , 
    this.label , this.hint , this.icon , this.validation}):super (key:key); 

  final String? label ; 
  final String? hint ; 
  final IconData? icon ; 
  final String? Function(String?)? validation ; 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
        labelText: label , 
        hintText: hint , 
      ),
      validator: validation,
    );
  }
}