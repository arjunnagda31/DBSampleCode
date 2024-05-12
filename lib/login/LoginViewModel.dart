import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_router/router.dart';
import '../databasehelper/DatabaseHelper.dart';

class LoginViewModel extends ChangeNotifier {
  var objEmailcontroller = TextEditingController();
  var objPasswordcontroller = TextEditingController();

  init() {}

  getLogin() async {
    if (objEmailcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter email");
    } else if (objPasswordcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter password");
    } else {
      final dbHelper = DatabaseHelper();
      var output = await dbHelper.getUserByUsername(objEmailcontroller.text);
      print(output);
      print(output?.username ?? "");
      print(output?.email ?? "");
      print(output?.password ?? "");
      String strEmail = output?.email ?? "";
      print(strEmail);

      if (strEmail != "") {
        var objPref = await SharedPreferences.getInstance();
        objPref.setString("user_name", output?.username ?? "");
        objPref.setString("user_email", output?.email ?? "");
        objPref.setString("user_password", output?.password ?? "");
        Get.offNamedUntil(Routes.DashboardView,
            (route) => false); //(DashboardView() as Route, (route) => false);
      }else{
        Get.snackbar("error", "Invalid inputs");

      }
    }
  }
}
