import 'package:bico/beans/biquer.dart';
import 'package:bico/components/card_biquer.dart';
import 'package:bico/components/enddrawer.dart';
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
      //appBar: AppBarCustom(),
      endDrawer: EndDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    )),
                background: Image.network(
                  "https://images.unsplash.com/photo-1504610926078-a1611febcad3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: biquerlist.length,
          itemBuilder: (context, index) => CardBiquer(
            biquer: biquerlist[index],
          ),
        ),
      ),
    );
  }
}
