
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';

class CategoryPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBarWidget(
          text: "Categorías",
        ),
      ),
      body: StreamBuilder(
        stream: ,
        builder: (BuildContext context, AsyncSnapshot snap){
          return Text("Hola");
        },
      ),
    );
  }
}
