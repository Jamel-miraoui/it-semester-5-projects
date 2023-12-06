import 'package:flutter/material.dart';
import 'package:tp6/list_employe.dart';



void main()
{
  runApp(GestionEmployee());
}

class GestionEmployee extends StatelessWidget {
  const GestionEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:List_employe(),);
  }
}

