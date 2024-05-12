import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sampleapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router/locator.dart';
import 'app_router/router.dart';
import 'app_router/router.gr.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerDelegate: locator<AppRouter>().delegate(),
    //   routeInformationParser: locator<AppRouter>().defaultRouteParser(),
    // );
   // var strNm = objPref.getString("user_name") ?? "";
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  Routes.SplashView,
      getPages: getPages,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Future<Widget> build(BuildContext context)async {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     var objPref = await SharedPreferences.getInstance();
//     var strNm = objPref.getString("user_name") ?? "";
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute:  strNm != "" ?Routes.DashboardView :Routes.LoginView,
//       getPages: getPages,
//     );
//   }
// }
