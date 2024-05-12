import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sampleapp/dashboard/DashboardView.dart';
import 'package:sampleapp/login/LoginView.dart';
import 'package:sampleapp/mpin/MPINViewModel.dart';
import 'package:sampleapp/register/register_view.dart';
import 'package:sampleapp/splash/SplashView.dart';

import '../mpin/MPINView.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String LoginView = '/LoginView';
  static String RegisterView = '/RegisterView';
  static String DashboardView = '/DashboardView';
  static String MPINView = '/MPINView';
  static String SplashView = '/SplashView';


}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(name: Routes.LoginView, page: () => const LoginView()),
  GetPage(name: Routes.RegisterView, page: () => const RegisterView()),
  GetPage(name: Routes.DashboardView, page: () => const DashboardView()),
  GetPage(name: Routes.MPINView, page: () => const MPINView()),
  GetPage(name: Routes.SplashView, page: () => const SplashView()),

];
