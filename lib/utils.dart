import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  Future<String> getLoggedInUserNm () async {
    var objPref = await SharedPreferences.getInstance();
    String val = objPref.getString("user_name") ?? "";
    print(val);
    return val;
  }

}