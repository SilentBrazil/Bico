import 'package:bico/beans/adress.dart';
import 'package:bico/beans/document.dart';

class Biquer{
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
}