import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/general/fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;

  TextWidget({
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
      ),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;

  H1({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: kH1Size,
      color: kBrandPrimaryColor,
      fontWeight: FontWeight.w600,
    );
  }
}
