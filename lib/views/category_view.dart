import 'package:bico/beans/biquer.dart';
import 'package:bico/components/appbar_custom_return.dart';
import 'package:bico/components/card_biquer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final String category;
  var biquerlist = new List<Biquer>();

  CategoryView({this.category}) {
    biquerlist = [];
    biquerlist.add(new Biquer(
        name: "André", category: "Construção Civil", rating: 3.2, range: 5.5));
    biquerlist.add(new Biquer(
        name: "Maria", category: "Doméstica", rating: 4.1, range: 1.2));
    biquerlist.add(new Biquer(
        name: "José Pascal", category: "Mecânico", rating: 2.2, range: 7.0));
    biquerlist.add(new Biquer(
        name: "Beatriz", category: "Consultoria", rating: 4.5, range: 6.2));
    biquerlist.add(new Biquer(
        name: "Debora", category: "Saúde", rating: 4.5, range: 10.5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomReturn(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              height: 550,
              child: ListView.builder(
                itemCount: biquerlist.length,
                itemBuilder: (context, index) => CardBiquer(
                  biquer: biquerlist[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
