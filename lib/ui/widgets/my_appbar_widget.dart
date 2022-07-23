
import 'package:flutter/material.dart';
import 'package:menuapp/main.dart';
import 'package:menuapp/ui/general/colors.dart';

class MyAppBarWidget extends StatelessWidget {

  String text;
  MyAppBarWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBrandPrimaryColor,
      title: Text(text),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }
}
