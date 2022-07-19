import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/general/fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;

  TextWidget({
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
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
      height: 1.1,
    );
  }
}

class TextNormal extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;

  TextNormal({
    required this.text,
    this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      maxLines: maxLines,
      fontSize: textNormalSize,
      color: color ?? kBrandPrimaryColor,
    );
  }
}
