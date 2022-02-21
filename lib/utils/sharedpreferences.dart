import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences pref;

  void setPref() async {
    pref = await SharedPreferences.getInstance();
  }
}