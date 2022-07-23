
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';
import 'package:menuapp/ui/widgets/textfield_widget.dart';

class ProductFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBarWidget(
          text: "Agregar producto",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFieldWidget(),
              TextFieldWidget(),
              TextFieldWidget(),
              TextFieldWidget(),
              TextFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
