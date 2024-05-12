import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_router/router.dart';
import '../databasehelper/DatabaseHelper.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterViewModel extends ChangeNotifier {
  var objEmailcontroller = TextEditingController();
  var objUserNmlcontroller = TextEditingController();
  var objPasswordcontroller = TextEditingController();

  init() {}

  addUser() async {
    if (objUserNmlcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter name");
    } else if (objEmailcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter email");
    } else if (objPasswordcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter password");
    } else {
      final dbHelper = DatabaseHelper();
      final user = User(
        username: objUserNmlcontroller.text,
        email: objEmailcontroller.text,
        password: objPasswordcontroller.text,
      );
      var response = await dbHelper.insertUser(user);
      print(response);
      // if (response == 1){
      var objPref = await SharedPreferences.getInstance();
      objPref.setString("user_name", objUserNmlcontroller.text);
      objPref.setString("user_email", objEmailcontroller.text);
      objPref.setString("user_password", objPasswordcontroller.text);
      Get.offNamedUntil(Routes.DashboardView, (route) => false);
    }
  }
}
