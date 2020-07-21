import 'package:bico/beans/biquer.dart';
import 'package:bico/components/logo_bico.dart';
import 'package:bico/components/title_left.dart';
import 'package:flutter/material.dart';

class BiquerView extends StatelessWidget {
  final Biquer biquer;

  const BiquerView({Key key, this.biquer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoBico(),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(biquer.photo),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 115,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          biquer.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                          child: Container(
                            width: 200,
                            child: Text(
                              biquer.category,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: Text("Fazer orçamento"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20,
                  ),
                  Text(
                    biquer.rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text("  |  "),
                  Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  Text(
                    "${biquer.range.toString()} km",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "https://picsum.photos/200/200") //site gera imagem dinamicamente"
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TitleLeft(
              text: "Cometários",
              color: Colors.black,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                        children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Tomás aquino",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text("  -  "),
                            Text(
                              "21/07/2020",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    ],
                  ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
