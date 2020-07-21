import 'package:flutter/material.dart';

class TitleLeft extends StatelessWidget {
  final String text;
  final color;

  const TitleLeft({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
      ),
    );
  }
}
