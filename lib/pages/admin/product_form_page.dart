import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';
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
              TextFieldWidget(
                hintText: "Nombre del producto",
              ),
              TextFieldWidget(
                hintText: "Descripción",
                maxLines: 4,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Precio",
                      isNumeric: true,
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Descuento",
                      isNumeric: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Tiempo",
                      isNumeric: true,
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Porciones",
                      isNumeric: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Calificación",
                      isNumeric: true,
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
                child: Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                ),
              ),
              TextNormal(
                text: "Ingredientes",
              ),
              divider12,
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Ingrediente",
                    ),
                  ),
                  dividerWidth10,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kBrandSecondaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12.0,
                      offset: const Offset(4, 4),
                    )
                  ],
                ),
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: TextNormal(text: "Ingrediente $index"),
                      trailing: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/trash.svg',
                          height: 18.0,
                          color: kBrandPrimaryColor.withOpacity(0.8),
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
              divider40,
              divider40,
            ],
          ),
        ),
      ),
    );
  }
}
