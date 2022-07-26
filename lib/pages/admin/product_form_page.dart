import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/my_appbar_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';
import 'package:menuapp/ui/widgets/textfield_widget.dart';

class ProductFormPage extends StatefulWidget {
  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final TextEditingController _ingredientController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _discountController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  final TextEditingController _servingController = TextEditingController();

  final TextEditingController _rateController = TextEditingController();

  List<String> _ingredients = [];

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
                controller: _nameController,
              ),
              TextFieldWidget(
                hintText: "Descripción",
                maxLines: 4,
                controller: _descriptionController,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Precio",
                      isNumeric: true,
                      controller: _priceController,
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Descuento",
                      isNumeric: true,
                      controller: _discountController,
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
                      controller: _timeController,
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: TextFieldWidget(
                      hintText: "Porciones",
                      isNumeric: true,
                      controller: _servingController,
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
                      controller: _rateController,
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
                      controller: _ingredientController,
                    ),
                  ),
                  dividerWidth10,
                  InkWell(
                    onTap: () {
                      _ingredients.add(_ingredientController.text);
                      _ingredientController.clear();
                      setState(() {});
                    },
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
              _ingredients.isNotEmpty
                  ? Container(
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
                        itemCount: _ingredients.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: TextNormal(text: _ingredients[index]),
                            trailing: IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/trash.svg',
                                height: 18.0,
                                color: kBrandPrimaryColor.withOpacity(0.8),
                              ),
                              onPressed: () {
                                _ingredients.removeAt(index);
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/box.png',
                            height: 90.0,
                            color: kBrandPrimaryColor.withOpacity(0.8),
                          ),
                          divider6,
                          TextNormal(text: "Aún no hay ingredientes",),
                        ],
                      )
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
