import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(45.0),
                    bottomLeft: Radius.circular(45.0),
                  ),
                  child: Image.network(
                    "https://img.freepik.com/fotos-premium/hamburguesa-carne-artesanal-queso-tocino-cebolla-caramelizada-hojas-rucula-sobre-mesa-madera_74692-158.jpg?w=2000",
                    height: height * 0.45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  bottom: -25,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cheese Burger Total asdsadsa asdsadsadsa asdasds",
                            style: TextStyle(
                              color: kBrandPrimaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Plato de fondo"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 14.0,
                                color: Color(0xffFDBF4F),
                              ),
                              dividerWidth3,
                              Text(
                                "4.0",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: kBrandPrimaryColor,
                                ),
                              ),
                              dividerWidth3,
                              Text(" | "),
                              dividerWidth3,
                              Text(
                                "20 min.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: kBrandPrimaryColor,
                                ),
                              ),
                              dividerWidth3,
                              Text(" | "),
                              dividerWidth3,
                              Text(
                                "Porciones: 1",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: kBrandPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
