import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: Text("Productos"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "https://comidaperuanaweb.org/wp-content/uploads/2018/10/Rocoto-Relleno-1-1-1.png"),
                ),
                dividerWidth10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: kBrandSecondaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "Plato de fondo",
                          style: TextStyle(
                            fontSize: 12.0
                          ),
                        ),
                      ),
                      Text(
                        "Rocoto Relleno",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      divider3,
                      TextNormal(
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        color: kBrandPrimaryColor.withOpacity(.6),
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                      ),
                      divider6,
                      Row(
                        children: [Text("S/ 30.00   |   7 min.")],
                      ),
                    ],
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
