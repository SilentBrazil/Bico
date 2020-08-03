import 'package:bico/beans/job.dart';
import 'package:bico/beans/service.dart';
import 'package:bico/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  Future<List<Job>> retrieveJobs() async {
    List<Job> joblist = [];
    await Firestore.instance
        .collectionGroup("Jobs")
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((element) {
        //print(element.data);
        joblist.add(Job.fromMap(element.data, element.documentID));
      });
    });
    return joblist;
  }

  Future<List<Job>> retrieveJobsFromService() async {
    List<Job> joblist = [];
    QuerySnapshot snapshot =
        await Firestore.instance.collectionGroup("Jobs").getDocuments();
    await Future.forEach(snapshot.documents, (DocumentSnapshot element) async {
      //snapshot.documents.forEach((element) async {
      //print(element.data);
      if (element != null) {
        joblist.add(Job.fromMap(element.data, element.documentID));
        ServiceModel serviceModel = ServiceModel();
        await serviceModel.retrieveServiceFromJob(element, joblist.last).then((service) {
          if (joblist.isNotEmpty && joblist != null) {
            joblist.last.service = service;
          }
        });
      }
    });
    return joblist;
  }


}
