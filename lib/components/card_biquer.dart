import 'package:bico/beans/biquer.dart';
import 'package:bico/views/biquer_view.dart';
import 'package:flutter/material.dart';

class CardBiquer extends StatelessWidget {
  final Biquer biquer;

  const CardBiquer({Key key, this.biquer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute( builder:(context) => BiquerView(biquer: biquer,)));
            print("print1");
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(biquer.photoUrl)))),
                    /*Text(
                        item,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),*/
                    Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              biquer.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 260,
                                child: Text(
                                  biquer.category,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                  ),
                                  Text(
                                    biquer.rating.toString(),
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text("  |  "),
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                  ),
                                  Text(
                                    "${biquer.range.toString()} km",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
