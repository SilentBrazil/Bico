import 'package:bico/beans/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  Future<List<Category>> retrieveCategory() async {
    List<Category> categorylist = [];
    await Firestore.instance.collection('Categories').getDocuments().then((
        snapshot) {
      snapshot.documents.forEach((element) {
        //print(element.data);
        categorylist.add(Category.fromMap(element.data,element.documentID));
      });
    });
    return categorylist;
  }

}