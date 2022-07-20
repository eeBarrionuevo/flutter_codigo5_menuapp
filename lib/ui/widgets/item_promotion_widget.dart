import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/pages/customer/product_detail_page.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';

class ItemPromotionWidget extends StatelessWidget {
  const ItemPromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.0),
      splashColor: Colors.black.withOpacity(0.08),
      highlightColor: Colors.black.withOpacity(0.05),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl:
            "https://img.freepik.com/fotos-premium/hamburguesa-carne-artesanal-queso-tocino-cebolla-caramelizada-hojas-rucula-sobre-mesa-madera_74692-158.jpg?w=2000",
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(14.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: kBrandSecondaryColor,
                    ),
                    child: Text(
                      "50% desc",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 14.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.88),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 0.0),
                          decoration: BoxDecoration(
                            color: kBrandSecondaryColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            "Plato de fondo",
                            style: TextStyle(
                              color: kBrandPrimaryColor,
                            ),
                          ),
                        ),
                        divider3,
                        Text(
                          "Cheese Burger Total",
                          style: TextStyle(
                            color: kBrandPrimaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        divider3,
                        Row(
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
                              ),
                            ),
                            dividerWidth3,
                            Text(" | "),
                            dividerWidth3,
                            Text(
                              "20 min.",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            dividerWidth3,
                            Text(" | "),
                            dividerWidth3,
                            Text(
                              "Porciones: 1",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
