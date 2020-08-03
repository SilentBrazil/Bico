import 'package:bico/beans/job.dart';
import 'package:bico/beans/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  Future<List<Service>> retrieveServices() async {
    List<Service> servicelist = [];
    await Firestore.instance
        .collectionGroup('Services')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((element) {
        //print(element.data);
        servicelist.add(Service.fromMap(element.data, element.documentID));
      });
    });
    return servicelist;
  }
  Future<Service> retrieveServiceFromJob(
      DocumentSnapshot element, Job job) async {
    //print("reference2 ${element.reference.collection('Jobs').path.toString()}");
    Service aux;
    await element.reference.parent().parent().get().then((service) {
      if (service != null) {
        Service s = Service.fromMap(service.data, service.documentID);
        aux = s;
        //service.jobs = joblist;
        //print("retrieveJobs: ${service.title}");
        //print("retrieveJobs: ${service.jobs.length}");
        //print("Job ${j.price}");
      }
    });
    return aux;
  }


/*
  Future<List<Service>> retrieveServiceJobs() async {
    List<Service> servicelist = [];
    await Firestore.instance
        .collectionGroup('Services')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((element) async {
        //print(element.data);
        if (element != null) {
          servicelist.add(Service.fromMap(element.data, element.documentID));
          await retrieveJobs(element, servicelist.last).then((joblist) {
            if (joblist.isNotEmpty && joblist != null) {
              servicelist.last.jobs = joblist;
              print("acabei1 ${servicelist[0].jobs.length}");
            }
          });
        }
      });
    });
    print("retornou sem acabar Services:${servicelist.length}");
    print("retornou sem acabar Title:${servicelist.last.title}");
    print("retornou sem acabar Job:${servicelist.last.jobs.length}");
    return servicelist;
  }

  Future<List<Job>> retrieveJobs(
      DocumentSnapshot element, Service service) async {
    //print("reference2 ${element.reference.collection('Jobs').path.toString()}");
    List<Job> joblist = [];
    await element.reference.collection('Jobs').getDocuments().then((snapshot) {
      snapshot.documents.forEach((job) {
        if (job != null) {
          Job j = Job.fromMap(job.data, job.documentID);
          joblist.add(j);
          //service.jobs = joblist;
          //print("retrieveJobs: ${service.title}");
          //print("retrieveJobs: ${service.jobs.length}");
          //print("Job ${j.price}");
        }
      });
    });
    return joblist;
  }
  */

}
