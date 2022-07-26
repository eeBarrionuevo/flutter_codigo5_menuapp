import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
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
  XFile? _image;

  getImageGallery() async {
    ImagePicker _imagePicker = ImagePicker();
    _image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  getImageCamera() async {
    ImagePicker _imagePicker = ImagePicker();
    _image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                  TextNormal(text: " Categoría:"),
                ],
              ),
              divider6,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2,),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: "1",
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text(
                          "Hola",
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              divider20,
              divider6,
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
                          TextNormal(
                            text: "Aún no hay ingredientes",
                          ),
                        ],
                      )),
              divider20,
              const SizedBox(
                height: 30.0,
                child: Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                ),
              ),
              TextNormal(
                text: "Imagen del producto",
              ),
              divider20,
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          getImageGallery();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xfff72585),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/gallery.svg',
                          color: Colors.white,
                        ),
                        label: Text(
                          "Galería",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  dividerWidth10,
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          getImageCamera();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff4361ee),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/camera.svg',
                          color: Colors.white,
                        ),
                        label: Text(
                          "Cámara",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              divider20,
              Container(
                height: height * 0.32,
                width: width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12.0,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  // child: Image.network(
                  //   "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  //   fit: BoxFit.cover,
                  // ),
                  // child: Image.asset(
                  //   fit: BoxFit.cover,
                  //   'assets/images/placeholder.png',
                  // ),
                  child: Image(
                    image: _image != null
                        ? FileImage(File(_image!.path))
                        : AssetImage('assets/images/placeholder.png')
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
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
