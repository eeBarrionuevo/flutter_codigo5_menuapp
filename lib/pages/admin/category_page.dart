import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class CategoryPage extends StatelessWidget {
  final FirestoreService _categoryService =
      FirestoreService(collection: 'categories');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBarWidget(
          text: "Categorías",
        ),
      ),
      body: StreamBuilder(
        stream: _categoryService.getStreamCategory(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot collection = snap.data;
            List<Map<String, dynamic>> productsMap = collection.docs
                .map((e) => e.data() as Map<String, dynamic>)
                .toList();
            return ListView.builder(
              itemCount: productsMap.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kBrandPrimaryColor,
                    child: Text(
                      productsMap[index]["category"][0],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: TextNormal(text: productsMap[index]["category"]),
                  subtitle: Text(
                      "Estado: ${productsMap[index]["status"] ? 'Activo' : 'Desactivo'}"),
                );
              },
            );
          }
          return loadingWidget();
        },
      ),
    );
  }
}
