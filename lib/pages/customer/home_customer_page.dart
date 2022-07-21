import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/general/fonts.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_category_widget.dart';
import 'package:menuapp/ui/widgets/item_product_widget.dart';
import 'package:menuapp/ui/widgets/item_promotion_widget.dart';
import 'package:menuapp/ui/widgets/search_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class HomeCustomerPage extends StatefulWidget {
  const HomeCustomerPage({Key? key}) : super(key: key);

  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {

  final FirestoreService _productService = FirestoreService(collection: "products");
  List<ProductModel> products = [];
  List<ProductModel> promotionProducts = [];

  int indexCategory = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFirebase();
  }

  getDataFirebase() async{
    products = await _productService.getProducts();
    promotionProducts = products.where((element) => element.discount > 0).toList();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider12,
                TextNormal(
                  text: "Bienvenidos",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                divider12,
                SearchWidget(),
                divider12,
                TextNormal(
                  text: "Promociones",
                ),
                divider12,
                SizedBox(
                  height: 260.0,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: promotionProducts.length,
                    controller: PageController(
                      initialPage: 0,
                      viewportFraction: 0.8,
                    ),
                    padEnds: false,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemPromotionWidget(
                        productModel: promotionProducts[index],
                      );
                    },
                  ),
                ),
                divider20,
                TextNormal(
                  text: "Categorías",
                ),
                divider20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ItemCategoryWidget(
                        text: "Todos",
                        selected: indexCategory == 0,
                        onTap: () {
                          indexCategory = 0;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Platos de fondo",
                        selected: indexCategory == 1,
                        onTap: () {
                          indexCategory = 1;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Bebidas",
                        selected: indexCategory == 2,
                        onTap: () {
                          indexCategory = 2;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Entradas",
                        selected: indexCategory == 3,
                        onTap: () {
                          indexCategory = 3;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Postres",
                        selected: indexCategory == 4,
                        onTap: () {
                          indexCategory = 4;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                divider20,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index){
                    return ItemProductWidget(
                      productModel: products[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
