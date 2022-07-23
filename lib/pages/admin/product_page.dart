import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_admin_producto_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ProductPage extends StatelessWidget {
  final CollectionReference _productReference =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: Text("Productos"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: kBrandPrimaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            dividerWidth6,
            Text(
              "Agregar",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _productReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot collection = snap.data;
            List<ProductModel> products = collection.docs.map((e) {
              ProductModel product =
                  ProductModel.fromJson(e.data() as Map<String, dynamic>);
              product.id = e.id;
              return product;
            }).toList();

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ItemAdminProductWidget(
                  productModel: products[index],
                );
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
