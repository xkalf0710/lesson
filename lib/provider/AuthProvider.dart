import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  removeToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("ACCESS_TOKEN");
    prefs.setBool("isLoggedIn", false);
  }

  setAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("ACCESS_TOKEN");
    prefs.setBool("isLoggedIn", false);
  }
}