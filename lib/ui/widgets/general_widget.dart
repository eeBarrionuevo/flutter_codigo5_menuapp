

import 'package:flutter/material.dart';


const divider3 = SizedBox(height: 3.0,);
const divider6 = SizedBox(height: 6.0,);
const divider12 = SizedBox(height: 12.0,);
const divider20 = SizedBox(height: 20.0,);
const divider30 = SizedBox(height: 30.0,);
const divider40 = SizedBox(height: 40.0,);


const dividerWidth3 = SizedBox(
  width: 3.0,
);

const dividerWidth6 = SizedBox(
  width: 6.0,
);

const dividerWidth10 = SizedBox(
  width: 10.0,
);

Widget circleWidget(double radius) {
  return Container(
    height: radius * 2,
    width: radius * 2,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withOpacity(0.13),
    ),
  );
}
