import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ItemMenuWidget extends StatelessWidget {
  String text;
  String img;

  ItemMenuWidget({
    required this.text,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 74,
            height: 74,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/$img.png',
            ),
          ),
          divider12,
          TextNormal(
            text: text,
          ),
        ],
      ),
    );
  }
}
