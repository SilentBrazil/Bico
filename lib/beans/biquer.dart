import 'package:bico/beans/adress.dart';
import 'package:bico/beans/document.dart';

/*class Biquer{
  String key;
  String name;
  Document document;
  Address address;

  //for test
  String category;
  double rating;
  double range;
  //String photo = "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg";
  String photoUrl = "https://vignette.wikia.nocookie.net/gta/images/7/70/CJ-GTASA.png/revision/latest/top-crop/width/360/height/450?cb=20170321232122&path-prefix=pt";

  Biquer({this.name,this.category,this.rating,this.range});
}*/
class Biquer {
  String key;
  Address address;
  Document document;
  String picURL;
  String uid;

  Biquer({this.address, this.document, this.picURL, this.uid});

  Biquer.fromMap(Map<String, dynamic> json, String key) {
    this.key = key;
    address =
    json['address'] != null ? new Address.fromMap(json['address']) : null;
    document = json['document'] != null
        ? new Document.fromMap(json['document'])
        : null;
    picURL = json['picURL'];
    uid = json['uid'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toMap();
    }
    if (this.document != null) {
      data['document'] = this.document.toMap();
    }
    data['picURL'] = this.picURL;
    data['uid'] = this.uid;
    return data;
  }
}



