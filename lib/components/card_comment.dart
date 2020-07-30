import 'package:flutter/material.dart';

class CardComment extends StatelessWidget {
  final double rating;
  final String client;
  final String comment;
  final String date;

  const CardComment(
      {Key key, this.rating, this.client, this.comment, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  client,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text("  -  "),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              comment,
            ),
          ],
        ),
      ),
    );
  }
}
