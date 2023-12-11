import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    this.label = "",
    this.isChecked = false,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
          ),
          Text(label),
        ],
      ),
    );
  }
}
