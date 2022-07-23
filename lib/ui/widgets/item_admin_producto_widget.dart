
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class ItemAdminProductWidget extends StatelessWidget {
  const ItemAdminProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
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
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: kBrandSecondaryColor.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Plato de fondo",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    divider3,
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
          Positioned(
            right: -12,
            top: -10,
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              icon: Icon(
                Icons.more_vert,
                color: kBrandPrimaryColor.withOpacity(0.8),
              ),
              onSelected: (value){
                print(value);
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/edit.svg'),
                        dividerWidth6,
                        TextNormal(text: "Actualizar",),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/trash.svg'),
                        dividerWidth6,
                        TextNormal(text: "Eliminar",),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
