
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final String collection;

  FirestoreService({required this.collection});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  Future<List> getProducts() async{
    List<Map<String, dynamic>> products = [];
    QuerySnapshot _querySnapshot =  await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      Map<String, dynamic> product = element.data() as Map<String, dynamic>;
      product["id"] = element.id;
      products.add(product);
    });
    return products;
  }

}