
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_router/router.dart';
import '../databasehelper/DatabaseHelper.dart';




class MPINViewModel extends ChangeNotifier {

  var objPasswordcontroller  = TextEditingController();
String usernm = "";
  init()async {
    var objPref = await SharedPreferences.getInstance();
    usernm = objPref.getString("user_name") ?? "";
    notifyListeners();
  }

  getAccount()async{
    if(objPasswordcontroller.text.isEmpty) {
      Get.snackbar("error", "Enter mpin/password");
    }else {
      final dbHelper = DatabaseHelper();
      var objPref = await SharedPreferences.getInstance();
      var output = await dbHelper.getUserByPassword(objPref.getString("user_email") ?? "",objPasswordcontroller.text);
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
        Get.offNamedUntil(Routes.DashboardView, (
           route) => false);
      }else{
        Get.snackbar("error", "Bed Credintail");

      }
    }
  }

}
