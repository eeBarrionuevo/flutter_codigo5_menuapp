import 'package:flutter/material.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/ui/widgets/item_product_widget.dart';

class SearchProductDelegate extends SearchDelegate {
  List<ProductModel> products;

  SearchProductDelegate({
    required this.products,
  });

  List<String> names = [
    "Juan",
    "Luis",
    "Carlos",
    "Diana",
    "Susana",
    "Maria",
    "Alejandra",
    "Mariela",
    "Angela",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.arrow_back_ios_sharp,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductModel> productsResult = products
        .where((element) =>
        element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: productsResult.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemProductWidget(
          productModel: productsResult[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> productsSuggestion = products
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: productsSuggestion.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemProductWidget(
          productModel: productsSuggestion[index],
        );
      },
    );
  }
}
