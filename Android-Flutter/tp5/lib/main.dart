import 'package:flutter/material.dart';
import 'package:tp5/pages/add_employe.dart';


void main() {
  runApp(GestionEmploye());
}
class GestionEmploye extends StatelessWidget {
  const GestionEmploye({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddEmploye());
  }
}
