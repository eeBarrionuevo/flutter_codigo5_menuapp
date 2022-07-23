import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_admin_producto_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ProductPage extends StatelessWidget {

  final CollectionReference _productReference = FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: Text("Productos"),
      ),
      body: StreamBuilder(
        stream: _productReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){

            QuerySnapshot collection = snap.data;
            List<ProductModel> products = collection.docs.map((e){
              ProductModel product = ProductModel.fromJson(e.data() as Map<String, dynamic>);
              product.id = e.id;
              return product;
            }).toList();

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ItemAdminProductWidget();
              },
            );
          }
          return Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: kBrandSecondaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
