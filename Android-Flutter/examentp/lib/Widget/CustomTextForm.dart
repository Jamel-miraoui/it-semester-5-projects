import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.label = "",
    this.hint = "",
    this.uneIcone,
    this.typeClavier,
    this.valider,
    this.saved,
  });

  final String label;
  final String hint;
  final IconData? uneIcone;
  final String? Function(String?)? valider;
  final TextInputType? typeClavier;
  final void Function(String?)? saved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: TextFormField(
        style:
            const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        keyboardType: typeClavier,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          label: Text(label),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.blue),
          //icon: Icon(Icons.login_rounded, size: 32),
          prefixIcon: Icon(uneIcone),
          prefixIconColor: Colors.blue,
          //iconColor: Colors.blue,
        ),
        validator: valider,
        onSaved: saved,
      ),
    );
  }
}
