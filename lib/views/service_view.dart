import 'package:bico/beans/biquer.dart';
import 'package:bico/beans/job.dart';
import 'package:bico/beans/service.dart';
import 'package:bico/components/card_biquer.dart';
import 'package:bico/components/enddrawer.dart';
import 'package:bico/models/biquer_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceView extends StatefulWidget {
  final Service service;
  var biquerlist = new List<Biquer>();

  ServiceView({this.service}) {
    biquerlist = [];
    /*biquerlist.add(new Biquer(
        name: "André", category: "Construção Civil", rating: 3.2, range: 5.5));
    biquerlist.add(new Biquer(
        name: "Maria", category: "Doméstica", rating: 4.1, range: 1.2));
    biquerlist.add(new Biquer(
        name: "José Pascal", category: "Mecânico", rating: 2.2, range: 7.0));
    biquerlist.add(new Biquer(
        name: "Beatriz", category: "Consultoria", rating: 4.5, range: 6.2));
    biquerlist.add(new Biquer(
        name: "Debora", category: "Saúde", rating: 4.5, range: 10.5));*/
  }

  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _loadView() async{
    BiquerModel biquerModel = BiquerModel();
    biquerModel.retrieveBiquerFromService(widget.service.key).then((biquers) {
      setState(() {
        if (biquers != null) {
          widget.biquerlist = biquers;
        }
      });
    }, onError: (e) {
      print("Erro: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadView();
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
                title: Text(widget.service.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    )),
                background: Image.network(
                  widget.service.posterImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: widget.biquerlist.length,
          itemBuilder: (context, index) =>
              CardBiquer(
                  biquer: widget.biquerlist[index]
              ),
        ),
      ),
    );
  }
}
