import 'package:bico/beans/biquer.dart';
import 'package:bico/beans/service.dart';
import 'package:bico/components/appbar_custom.dart';
import 'package:bico/components/card_biquer.dart';
import 'package:bico/components/card_service.dart';
import 'package:bico/components/enddrawer.dart';
import 'package:bico/components/logo_bico.dart';
import 'package:bico/components/title_left.dart';
import 'package:bico/views/category_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var biquerlist = new List<Biquer>();
  var servicelist = new List<Service>();

  HomeView() {
    servicelist = [];
    servicelist
        .add(new Service(name: "Desenvolvimento de software", price: 500.00));
    servicelist.add(new Service(name: "Serviços domésticos", price: 150.00));
    servicelist.add(new Service(name: "Mecânico", price: 300.00));

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
    Firestore.instance.collection('Categories').getDocuments().then((value) {
      value.documents.forEach((element) {
        print(element.data);
      });
    });
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBarCustom(title: LogoBico(),withBackButton: false,),
      endDrawer: EndDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: Text(
                        "Olá Alysa,",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Text(
                        "qual o bico de hoje?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Color.fromRGBO(251, 251, 251, 100),
                      margin: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 5,
                      ),
                      child: Row(
                        children: [
                          /*IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                print("your menu action here");
                                _scaffoldKey.currentState.openDrawer();
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                              ),
                              onPressed: () {
                                print("your menu action here");
                              },
                            ),*/
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: "Buscar serviços disponíveis",
                                border: new OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*Container(
                height: 160.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          "Bico",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5), width: 1.0),
                              color: Colors.white),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  print("your menu action here");
                                  _scaffoldKey.currentState.openDrawer();
                                },
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Buscar serviços disponíveis",
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  print("your menu action here");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),*/
            TitleLeft(text: 'Serviços mais buscados',color: Colors.black,),
            Container(
              //margin: EdgeInsets.only(top: 270.0),
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: servicelist.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CardService(service: servicelist[index],)),
            ),
            TitleLeft(text: 'Biqueiros na sua região',color: Theme.of(context).primaryColor,),
            Container(
              //margin: EdgeInsets.only(top: 270.0),
              //height: double.infinity,
              width: double.infinity,
              height: 420,
              child: ListView.builder(
                itemCount: biquerlist.length,
                itemBuilder: (BuildContext context, int index) =>
                    CardBiquer(biquer: biquerlist[index],),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /* Foi para os componets
  Widget buildCardBiquer(BuildContext context, int index) {
    final biquer = biquerlist[index];
    return  InkWell(
      onTap: (){
        print("print1");
      },
      child: Card(
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
                                image: new NetworkImage(biquer.photo)))),
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

  Widget buildCardService(BuildContext context, int index) {
    final service = servicelist[index];
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryView(category: service.name,)));
        //print("onTap");
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 200.0,
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
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'A patir \n de R\$'),
                        new TextSpan(
                            text: service.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  */
}
