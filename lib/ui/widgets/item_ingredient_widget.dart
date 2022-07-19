
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ItemIngredientWidget extends StatelessWidget {
  const ItemIngredientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextNormal(text: "Carne"),
    );
  }
}
