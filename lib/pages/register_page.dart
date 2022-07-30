import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';
import 'package:menuapp/ui/widgets/textfield_password_widget.dart';
import 'package:menuapp/ui/widgets/textfield_widget.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  registerCustomer() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "mandarina@gmail.com",
      password: "3volution",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/1108117/pexels-photo-1108117.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          H1(text: "Regístrate"),
                          divider3,
                          TextNormal(text: "Por favor ingresa los datos requeridos"),
                          divider30,
                          TextFieldWidget(hintText: "Nombres", controller: _fullNameController),
                          TextFieldWidget(hintText: "Correo electrónico", controller: _emailController),
                          TextFieldPasswordWidget(controller: _passwordController),
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
