import 'package:flutter/material.dart';
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
              children: [
                Text(
                  "Bienvenidos",
                ),
                Text(
                  "Las espadas de Ramón",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                    color: Color(0xff121A3E),
                  ),
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
                H1(
                  text: "Las espadas de Ramón",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
