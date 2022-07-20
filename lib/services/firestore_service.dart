
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final String collection;

  FirestoreService({required this.collection});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  getProducts() async{
    QuerySnapshot _querySnapshot =  await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      print(element);
    });
  }

}