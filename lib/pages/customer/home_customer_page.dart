import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/general/fonts.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/search_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class HomeCustomerPage extends StatefulWidget {
  const HomeCustomerPage({Key? key}) : super(key: key);

  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenidos",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                divider12,
                SearchWidget(),
                divider12,
                Text(
                  "Promociones",
                ),
                divider12,
                SizedBox(
                  height: 260.0,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    controller: PageController(
                      initialPage: 0,
                      viewportFraction: 0.8,
                    ),
                    padEnds: false,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://img.freepik.com/fotos-premium/hamburguesa-carne-artesanal-queso-tocino-cebolla-caramelizada-hojas-rucula-sobre-mesa-madera_74692-158.jpg?w=2000",
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
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
                                  color: Colors.white,
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
                                        borderRadius:
                                            BorderRadius.circular(6.0),
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
                                    // Text(
                                    //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                    //   style: TextStyle(
                                    //     color: kBrandPrimaryColor.withOpacity(0.5),
                                    //     fontSize: 14.0,
                                    //     fontWeight: FontWeight.normal,
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        // Row(
                                        //   children: List.generate(
                                        //     5,
                                        //     (index) => const Icon(
                                        //       Icons.star,
                                        //       size: 14.0,
                                        //       color: Color(0xffFDBF4F),
                                        //     ),
                                        //   ),
                                        // ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
