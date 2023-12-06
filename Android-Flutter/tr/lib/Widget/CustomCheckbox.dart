import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    this.text = "",
    this.value,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value ?? false,
      onChanged: onChanged,
      title: Text(text),
    );
  }
}
