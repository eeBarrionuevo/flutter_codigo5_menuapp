import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_ingredient_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

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
                  bottom: -50,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: width * 0.8,
                        minWidth: width * 0.8,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 14.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              offset: const Offset(0, 5),
                              blurRadius: 12.0),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cheese Burger Total",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kBrandPrimaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          divider3,
                          TextNormal(
                            text: "Plato de Fondo",
                          ),
                          divider3,
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
                          divider6,
                          Text(
                            "S./ 30.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kBrandPrimaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            divider40,
            divider12,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNormal(
                    text: "Descripción:",
                  ),
                  divider12,
                  TextNormal(
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                    color: kBrandPrimaryColor.withOpacity(0.6),
                  ),
                  divider12,
                  TextNormal(
                    text: "Ingredientes:",
                  ),
                  divider12,
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      ItemIngredientWidget(text: "Carne"),
                      ItemIngredientWidget(text: "Pan artesanal"),
                      ItemIngredientWidget(text: "Lechuga"),
                      ItemIngredientWidget(text: "Tomates"),
                      ItemIngredientWidget(text: "Tocino"),
                      ItemIngredientWidget(text: "Queso"),
                      ItemIngredientWidget(text: "Cebolla caramelizada"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}