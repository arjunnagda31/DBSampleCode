
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_router/router.dart';




class DashboardViewModel extends ChangeNotifier {
  String strNm  = "kslhcklsdh";

  init() async{
    var objPref = await SharedPreferences.getInstance();
    strNm =  objPref.getString("user_name") ?? "";
    notifyListeners();
  }
  logout ()async{
    var objPref = await SharedPreferences.getInstance();
    objPref.remove("user_name");
    objPref.remove("user_email");
    objPref.remove("user_password");
    Get.offNamedUntil(Routes.LoginView, (route) => false);
  }

}
