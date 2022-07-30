import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/button_normal_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';
import 'package:menuapp/ui/widgets/textfield_password_widget.dart';
import 'package:menuapp/ui/widgets/textfield_widget.dart';

class RegisterPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void registerCustomer() async {
    if(_formKey.currentState!.validate()){
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print(userCredential.user!.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg",),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          H1(text: "Regístrate"),
                          divider3,
                          TextNormal(text: "Por favor ingresa los datos requeridos"),
                          divider30,
                          TextFieldWidget(hintText: "Nombres", controller: _fullNameController),
                          TextFieldWidget(hintText: "Correo electrónico", controller: _emailController),
                          TextFieldPasswordWidget(controller: _passwordController),
                          ButtonNormalWidget(
                            text: "Registrar",
                            icon: 'happy',
                            onPressed: () {
                              registerCustomer();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
