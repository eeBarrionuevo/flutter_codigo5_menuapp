import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/background_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_menu_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    divider30,
                    TextNormal(
                      text: "Bienvenido",
                    ),
                    H1(
                      text: "Las espadas de Ramón",
                    ),
                    divider30,
                    GridView.count(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      children: [
                        ItemMenuWidget(),
                        ItemMenuWidget(),
                        ItemMenuWidget(),
                        ItemMenuWidget(),
                        ItemMenuWidget(),
                        ItemMenuWidget(),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
