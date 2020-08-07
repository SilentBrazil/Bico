import 'package:bico/beans/biquer.dart';
import 'package:bico/beans/job.dart';
import 'package:bico/beans/service.dart';
import 'package:bico/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BiquerModel {
  Future<List<Biquer>> retrieveBiquer() async {
    List<Biquer> biquerlist = [];
    await Firestore.instance
        .collection('Biquer')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((element) {
        //print(element.data);
        if (element != null) {
          biquerlist.add(Biquer.fromMap(element.data, element.documentID));
        }
      });
    });
    return biquerlist;
  }

  Future<List<Biquer>> retrieveBiquerFromService(String keyservice) async {
    List<Biquer> biquerlist = [];
    QuerySnapshot snapshot = await Firestore.instance.collectionGroup('Jobs').getDocuments();
    await Future.forEach(snapshot.documents, (DocumentSnapshot element) async {
      if (element != null) {
        Job j = Job.fromMap(element.data, element.documentID);
        DocumentSnapshot serviceSnapshot = await element.reference.parent().parent().get();
        if(serviceSnapshot.documentID == keyservice){
          //Service s = Service.fromMap(serviceSnapshot.data, serviceSnapshot.documentID);
          biquerlist.add(await retrieveBiquerKey(j.userID));
          //print("length: ${biquerlist.length}");
        }
      }
    });
    return biquerlist;
  }

  Future<Biquer> retrieveBiquerKey(String user) async {
    Biquer biquer;
    var element = await Firestore.instance.collection('Biquer').document(user).get();
    Biquer.fromMap(element.data, element.documentID);
    //print(element.data);
    return biquer;
  }
}
