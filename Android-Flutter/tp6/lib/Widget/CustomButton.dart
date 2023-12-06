import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.text="",this.Coleur="", this.onpressed});

  @override
  
  final String text;
  final String Coleur;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(onPressed: onpressed, child:Text(text));
  }
}