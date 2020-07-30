import 'package:bico/beans/biquer.dart';
import 'package:bico/components/appbar_custom.dart';
import 'package:bico/components/card_comment.dart';
import 'package:bico/components/card_image.dart';
import 'package:bico/components/enddrawer.dart';
import 'package:bico/components/logo_bico.dart';
import 'package:bico/components/title_left.dart';
import 'package:flutter/material.dart';

class BiquerView extends StatelessWidget {
  final Biquer biquer;

  const BiquerView({Key key, this.biquer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: LogoBico()),
      endDrawer: EndDrawer(),
      /*appBar: AppBar(
        title: LogoBico(
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        elevation: 0.0,
      ),*/
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
                        image: new NetworkImage(biquer.photoUrl),
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
                  return CardImage(image: "https://picsum.photos/200/200",);
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
                  return CardComment(
                    client: "Tomás Aquino",
                    comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    date: "21/07/2020",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
