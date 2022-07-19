import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/general/fonts.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_category_widget.dart';
import 'package:menuapp/ui/widgets/search_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class HomeCustomerPage extends StatefulWidget {
  const HomeCustomerPage({Key? key}) : super(key: key);

  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  int indexCategory = 0;

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
                divider12,
                TextNormal(
                  text: "Bienvenidos",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                divider12,
                SearchWidget(),
                divider12,
                TextNormal(
                  text: "Promociones",
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
                divider20,
                TextNormal(
                  text: "Categorías",
                ),
                divider12,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ItemCategoryWidget(
                        text: "Todos",
                        selected: indexCategory == 0,
                        onTap: () {
                          indexCategory = 0;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Platos de fondo",
                        selected: indexCategory == 1,
                        onTap: () {
                          indexCategory = 1;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Bebidas",
                        selected: indexCategory == 2,
                        onTap: () {
                          indexCategory = 2;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Entradas",
                        selected: indexCategory == 3,
                        onTap: () {
                          indexCategory = 3;
                          setState(() {});
                        },
                      ),
                      ItemCategoryWidget(
                        text: "Postres",
                        selected: indexCategory == 4,
                        onTap: () {
                          indexCategory = 4;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                divider20,
                Container(
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
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Cheese Burger Total",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: kBrandPrimaryColor,
                              ),
                            ),
                            TextNormal(
                              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                              color: kBrandPrimaryColor.withOpacity(0.6),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),

                    ],
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
