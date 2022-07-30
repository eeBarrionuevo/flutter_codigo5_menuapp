import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  static final SPGlobal _instance = SPGlobal._();

  SPGlobal._();

  factory SPGlobal() {
    return _instance;
  }

  late SharedPreferences _prefs;

  Future initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

}
