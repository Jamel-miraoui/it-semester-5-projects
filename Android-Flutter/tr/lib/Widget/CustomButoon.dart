import 'package:flutter/material.dart';

class CustomButoon extends StatelessWidget {
  const CustomButoon({
    Key? key,
    this.text = "" , 
    this.color ,
    required this.onpressed
  }) : super(key: key);

  final String text; 
  final Color? color ; 
  final onpressed ; 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
      onPressed: onpressed  , child: Text(text));
  }
}
