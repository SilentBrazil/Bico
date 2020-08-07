import 'package:bico/beans/biquer.dart';
import 'package:bico/beans/job.dart';
import 'package:bico/components/appbar_custom.dart';
import 'package:bico/components/card_biquer.dart';
import 'package:bico/components/card_job.dart';
import 'package:bico/components/enddrawer.dart';
import 'package:bico/components/logo_bico.dart';
import 'package:bico/components/title_left.dart';
import 'package:bico/models/biquer_model.dart';
import 'package:bico/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeView extends StatefulWidget {
  List<Biquer> biquerlist = [];
  List<Job> joblist = [];


  HomeView() {
    /*servicelist = [];
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
        name: "Debora", category: "Saúde", rating: 4.5, range: 10.5));*/
  }

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _loadView() async{
    BiquerModel biquerModel = BiquerModel();
    biquerModel.retrieveBiquer().then((biquers) {
      setState(() {
        if(biquers != null){
          widget.biquerlist = biquers;
        }
      });
    }, onError: (e) {
      print("Erro: $e");
    });
    JobModel jobModel = JobModel();
    jobModel.retrieveJobsFromService().then((jobs) {
      setState(() {
        widget.joblist = jobs;
      });
    }, onError: (e) {
      print("Erro: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadView();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBarCustom(
        title: LogoBico(),
        withBackButton: false,
      ),
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
            TitleLeft(
              text: 'Serviços mais buscados',
              color: Colors.black,
            ),
            Container(
              //margin: EdgeInsets.only(top: 270.0),
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.joblist.length,
                  itemBuilder: (BuildContext context, int index) => CardJob(
                        service: widget.joblist[index].service,
                        job: widget.joblist[index],
                      )),
            ),
            TitleLeft(
              text: 'Biqueiros na sua região',
              color: Theme.of(context).primaryColor,
            ),
            Container(
              //margin: EdgeInsets.only(top: 270.0),
              //height: double.infinity,
              width: double.infinity,
              height: 420,
              child: ListView.builder(
                itemCount: widget.biquerlist.length,
                itemBuilder: (BuildContext context, int index) => CardBiquer(
                  biquer: widget.biquerlist[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
