import 'package:flutter/material.dart';

class CustomBouton extends StatelessWidget {
  const CustomBouton({
    super.key,
    this.text = "",
    this.couleur,
    required this.onpressed,
  });

  final String text;
  final Color? couleur;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(couleur),
      ),
      onPressed: onpressed,
      child: Text(text),
    );
  }
}
