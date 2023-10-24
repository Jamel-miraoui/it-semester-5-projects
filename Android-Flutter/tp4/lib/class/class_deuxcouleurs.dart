import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bouton(),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            height: 200,
            width: 200,
            color: color,
          )
        ],
      ),
    );
  }

  Widget bouton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (color == Colors.blue) {
            color = Colors.green;
          } else {
            color = Colors.blue;
          }
        });
      },
      child: Text("Click ici"),
    );
  }
}