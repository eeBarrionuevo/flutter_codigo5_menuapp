

import 'package:flutter/material.dart';
import 'package:menuapp/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Register"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
          },
        ),
      ),
    );
  }
}
