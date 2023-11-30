import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox ({ 
    Key? key , 
     this.value,
     this.msg = "",
     this.onchanged  
  }): super(key: key);


  final bool? value ; 
  final String msg ; 
  final void Function(bool?)? onchanged;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CheckboxListTile(value: value ?? false, onChanged: onchanged,title: Text(msg),);
  } 

}