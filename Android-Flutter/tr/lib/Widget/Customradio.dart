import 'package:flutter/material.dart';

class Customradio extends StatelessWidget {
  const Customradio({
    Key? key , 
    this.text ="" , 
    required this.onchanged , 
    this.value , 
    this.groupvalue = ''
  }):super(key: key );

  
  final String text ;
  final bool? value ; 
  final void Function(Object?)? onchanged;
  final String groupvalue ; 

  @override
  Widget build(BuildContext context) {
    return RadioListTile(value: value?? false , 
    title: Text(text), onChanged: onchanged, groupValue: groupvalue,);
  }
}