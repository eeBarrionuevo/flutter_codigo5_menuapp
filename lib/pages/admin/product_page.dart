import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/pages/admin/product_form_page.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/floating_button_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_admin_product_widget.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final CollectionReference _productReference =
      FirebaseFirestore.instance.collection('products');

  final FirestoreService _categoryReference =
      FirestoreService(collection: "categories");

  final FirestoreService _productService = FirestoreService(collection: "products");


  List<CategoryModel> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    categories = await _categoryReference.getCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBarWidget(
          text: "Productos",
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductFormPage(
                categories: categories,

              ),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: _productService.getStreamProduct(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  QuerySnapshot collection = snap.data;
                  List<ProductModel> products = collection.docs.map((e) {
                    ProductModel product =
                    ProductModel.fromJson(e.data() as Map<String, dynamic>);
                    product.id = e.id;

                    product.categoryDescription = categories.isNotEmpty ? categories
                        .firstWhere((element) => element.id == product.categoryId)
                        .category : "";

                    return product;
                  }).toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ItemAdminProductWidget(
                        productModel: products[index],
                        categories: categories,
                      );
                    },
                  );
                }
                return loadingWidget();
              },
            ),
            divider40,
            divider40,
          ],
        ),
      ),
    );
  }
}
