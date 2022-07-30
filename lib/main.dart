import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menuapp/helpers/sp_global.dart';
import 'package:menuapp/pages/admin/home_admin_page.dart';
import 'package:menuapp/pages/customer/home_customer_page.dart';
import 'package:menuapp/pages/customer/product_detail_page.dart';
import 'package:menuapp/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal _prefs = SPGlobal();
  await _prefs.initShared();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: LoginPage(),
      // home: ProductDetailPage(),
      // home: HomeAdminPage(),
    );
  }
}
