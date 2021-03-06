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
                                image: new NetworkImage("https://vignette.wikia.nocookie.net/gta/images/7/70/CJ-GTASA.png/revision/latest/top-crop/width/360/height/450?cb=20170321232122&path-prefix=pt")))),
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
                              "biquer name",
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
                                  "biquer service",
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
                                    "3,5",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text("  |  "),
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                  ),
                                  Text(
                                    "7.2 km",
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
