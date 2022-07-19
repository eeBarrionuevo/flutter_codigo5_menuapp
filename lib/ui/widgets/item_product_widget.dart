
import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12.0,
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.network(
              "https://www.localburger.com.co/web/image/725",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          dividerWidth10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cheese Burger Total",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrimaryColor,
                  ),
                ),
                Text(
                  "S./ 30.00",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrimaryColor,
                  ),
                ),
                divider3,
                TextNormal(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                  color: kBrandPrimaryColor.withOpacity(0.6),
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
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

        ],
      ),
    );
  }
}