import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/helpers/sp_global.dart';
import 'package:menuapp/models/user_mode.dart';
import 'package:menuapp/pages/customer/home_customer_page.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/widgets/button_normal_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_widget.dart';
import 'package:menuapp/ui/widgets/textfield_password_widget.dart';
import 'package:menuapp/ui/widgets/textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FirestoreService _userCollection =
      FirestoreService(collection: "users");

  final SPGlobal _prefs = SPGlobal();

  void registerCustomer() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        if (userCredential.user != null) {

          UserModel userModel = UserModel(
            fullName: _fullNameController.text,
            email: _emailController.text,
            role: "customer",
            status: true,
          );

          _userCollection.addUser(userModel).then((value) {

            if(value.isNotEmpty){
              _prefs.fullName = userModel.fullName;
              _prefs.email = userModel.email;
              _prefs.isLogin = true;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeCustomerPage(),
                  ),
                      (route) => false);
            }

          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.redAccent,
              content: Text("El correo electrónico ya está registrado"),
            ),
          );
        } else if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.redAccent,
              content: Text("La contraseña es débil, intenta con otra"),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.jpg",
          ),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 22.0),
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
                          TextNormal(
                              text: "Por favor ingresa los datos requeridos"),
                          divider30,
                          TextFieldWidget(
                              hintText: "Nombres",
                              controller: _fullNameController),
                          TextFieldWidget(
                              hintText: "Correo electrónico",
                              controller: _emailController),
                          TextFieldPasswordWidget(
                              controller: _passwordController),
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
