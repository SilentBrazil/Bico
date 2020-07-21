import 'package:flutter/material.dart';

class LogoBico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "BICO",
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w900,
        fontSize: 28,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
