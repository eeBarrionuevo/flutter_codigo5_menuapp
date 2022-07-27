
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/models/product_model.dart';

class FirestoreService{

  final String collection;

  FirestoreService({required this.collection});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  Future<List<ProductModel>> getProducts() async{
    List<ProductModel> products = [];
    QuerySnapshot _querySnapshot =  await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      // Map<String, dynamic> product = element.data() as Map<String, dynamic>;
      // product["id"] = element.id;
      ProductModel productModel = ProductModel.fromJson(element.data() as Map<String, dynamic>);
      productModel.id = element.id;
      products.add(productModel);
    });
    return products;
  }

  Future<List<CategoryModel>> getCategories() async{
    List<CategoryModel> categories = [];
    QuerySnapshot _querySnapshot = await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      CategoryModel categoryModel = CategoryModel.fromJson(element.data() as Map<String, dynamic>);
      categoryModel.id = element.id;
      categories.add(categoryModel);
    });
    return categories;
  }

  Future<String> addProduct(ProductModel productModel) async {
    DocumentReference documentReference = await _collectionReference.add(
      productModel.toJson(),
    );
    return documentReference.id;
  }

  Future<int> updateProduct(ProductModel productModel) async {
    await _collectionReference.doc(productModel.id).update(productModel.toJson());
    return 1;
  }



}