import 'package:bico/beans/service.dart';
import 'package:bico/views/category_view.dart';
import 'package:flutter/material.dart';

class CardService extends StatelessWidget {
  final Service service;

  const CardService({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryView(
                category: service.name,
              ),
            ),
          );
        },
        child: Container(
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: new NetworkImage(
                  "https://images.unsplash.com/photo-1504610926078-a1611febcad3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      service.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      //color: Colors.white70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          service.price.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  /*child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'A patir \n de R\$'),
                          new TextSpan(
                              text: service.price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
