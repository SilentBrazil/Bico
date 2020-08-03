import 'package:bico/beans/service.dart';

class Job {
  String key;
  double price;
  String userID;
  Service service;

  Job({this.price, this.userID});

  Job.fromMap(Map<String, dynamic> json, String key) {
    this.key = key;
    price = json['price'];
    userID = json['userID'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['userID'] = this.userID;
    return data;
  }
}