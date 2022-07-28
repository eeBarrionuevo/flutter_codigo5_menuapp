import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ItemAdminCategoryWidget extends StatelessWidget {
  Map<String, dynamic> category;

  ItemAdminCategoryWidget({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: kBrandPrimaryColor,
          child: Text(
            category["category"][0],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: TextNormal(text: category["category"]),
        subtitle: Text(
          "Estado: ${category["status"] ? 'Activo' : 'Desactivo'}",
        ),
      ),
    );
  }
}
