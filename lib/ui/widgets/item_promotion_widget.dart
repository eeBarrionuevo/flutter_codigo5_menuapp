import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/pages/customer/product_detail_page.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';

class ItemPromotionWidget extends StatelessWidget {

  ProductModel productModel;

  ItemPromotionWidget({required this.productModel});

  @override
  Widget build(BuildContext context) {

    print(productModel.id);

    return InkWell(
      borderRadius: BorderRadius.circular(14.0),
      splashColor: Colors.black.withOpacity(0.08),
      highlightColor: Colors.black.withOpacity(0.05),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productModel: productModel,
              isGeneral: false,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14.0),
        child: CachedNetworkImage(
          imageUrl: productModel.image,
          fadeInCurve: Curves.easeIn,
          fadeInDuration: const Duration(milliseconds: 800),
          imageBuilder: (context, imageProvider) {
            return Stack(
              children: [
                Hero(
                  tag: "${productModel.id!}promotion",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
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
                          productModel.name,
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
                              productModel.serving.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            dividerWidth3,
                            Text(" | "),
                            dividerWidth3,
                            Text(
                              "${productModel.time} min.",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            dividerWidth3,
                            Text(" | "),
                            dividerWidth3,
                            Text(
                              "Porciones: ${productModel.serving}",
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
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: kBrandSecondaryColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
