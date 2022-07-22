import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/category_model.dart';
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
import 'package:menuapp/utils/search_product_delegate.dart';

class HomeCustomerPage extends StatefulWidget {
  const HomeCustomerPage({Key? key}) : super(key: key);

  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  final FirestoreService _productService =
      FirestoreService(collection: "products");
  final FirestoreService _categoryService =
      FirestoreService(collection: "categories");
  List<ProductModel> products = [];
  List<ProductModel> productsAux = [];
  List<CategoryModel> categories = [];
  List<ProductModel> promotionProducts = [];

  int indexCategory = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFirebase();
  }

  getDataFirebase() async {
    categories = await _categoryService.getCategories();
    products = await _productService.getProducts();

    products = products.map((e) {
      String categoryDescription = categories
          .firstWhere((element) => element.id == e.categoryId)
          .category;
      e.categoryDescription = categoryDescription;
      return e;
    }).toList();

    productsAux = products;
    categories.insert(
      0,
      CategoryModel(
        id: "0",
        category: "Todos",
        status: true,
      ),
    );

    promotionProducts =
        products.where((element) => element.discount > 0).toList();

    setState(() {});
  }

  filterCategory(String categoryId) {
    products = productsAux;
    if (categoryId != "0") {
      products = products
          .where((element) => element.categoryId == categoryId)
          .toList();
    }
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
                SearchWidget(
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: SearchProductDelegate(),
                    );
                  },
                ),
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
                    children: categories
                        .map(
                          (e) => ItemCategoryWidget(
                            text: e.category,
                            selected: indexCategory == categories.indexOf(e)
                                ? true
                                : false,
                            onTap: () {
                              indexCategory = categories.indexOf(e);
                              filterCategory(e.id!);
                              setState(() {});
                            },
                          ),
                        )
                        .toList(),
                    // children: List.generate(
                    //   categories.length,
                    //   (index) => ItemCategoryWidget(
                    //     text: categories[index].category,
                    //     selected: indexCategory == index ? true : false,
                    //     onTap: (){
                    //       indexCategory = index;
                    //       setState((){});
                    //     },
                    //   ),
                    // ),
                  ),
                ),
                divider20,
                products.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemProductWidget(
                            productModel: products[index],
                          );
                        },
                      )
                    : Container(
                        width: double.infinity,
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/box.png',
                              height: 80.0,
                            ),
                            divider6,
                            TextNormal(
                              text: "Aún no hay productos en esta categoría",
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
