import 'package:bico/beans/biquer.dart';
import 'package:bico/beans/job.dart';
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

  Future<List<Job>> retrieveBiquerFromService(String keyservice) async {
    print("call me");
    List<Job> biquerlist = [];
    QuerySnapshot snapshot = await Firestore.instance.collection('Jobs').getDocuments();
    await Future.forEach(snapshot.documents, (DocumentSnapshot element) async {
      print("passou1");
      if (element != null) {
        Job j = Job.fromMap(element.data, element.documentID);
        ServiceModel serviceModel = ServiceModel();
        await serviceModel.retrieveServiceFromJob(element, j).then((service) {
          if (service.key == keyservice) {
            biquerlist.add(j);
            retrieveBiquerKey(j.userID);
          }
        });
      }
    });
    return biquerlist;
  }

  Future<List<Biquer>> retrieveBiquerKey(String user) async {
    print("call me2");
    List<Biquer> biquerlist = [];
    var snapshot = await Firestore.instance.collection('Biquer').document(user);
    snapshot.get().then((document) {
      print(document.data);
    });
    return biquerlist;
  }
}
