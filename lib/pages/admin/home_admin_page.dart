import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          //Fondo
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -height * 0.2,
                child: Transform.rotate(
                  angle: pi / 4.5,
                  child: Container(
                    height: height * 0.65,
                    width: height * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120.0),
                      gradient: LinearGradient(
                        colors: [
                          kBrandSecondaryColor,
                          const Color(0xff2ec4b6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -40,
                top: -10.0,
                child: circleWidget(
                  100.0,
                ),
              ),
              Positioned(
                right: -width * 0.22,
                top: 10.0,
                child: circleWidget(
                  120.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
