import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/floating_button_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_admin_category_widget.dart';
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
      floatingActionButton: FloatingButtonWidget(
        onTap: (){},
      ),
      body: StreamBuilder(
        stream: _categoryService.getStreamCategory(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot collection = snap.data;

            // List<Map<String, dynamic>> productsMap = collection.docs
            //     .map((e) => e.data() as Map<String, dynamic>)
            //     .toList();


            List<CategoryModel> categories = collection.docs.map((e){
              CategoryModel categoryModel = CategoryModel.fromJson(e.data() as Map<String, dynamic>);
              categoryModel.id = e.id;
              return categoryModel;
            }).toList();
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemAdminCategoryWidget(
                  category: categories[index],
                  onDelete: (){},
                  onUpdate: (){},
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
