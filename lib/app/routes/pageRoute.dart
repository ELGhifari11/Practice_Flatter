import 'package:flatter_project/app/modules/home/bindings/homeBindings.dart';
import 'package:flatter_project/app/modules/login/bindings/loginBindings.dart';
import 'package:flatter_project/app/modules/register/bindings/regisBindings.dart';
import 'package:flatter_project/app/routes/routeName.dart';
import 'package:flatter_project/app/modules/home/screen/home.dart';
import 'package:flatter_project/app/modules/login/screen/login.dart';
import 'package:flatter_project/screens/optionButtons.dart';
import 'package:flatter_project/app/modules/register/screen/register.dart';
import 'package:flatter_project/screens/splash.dart';
import 'package:get/route_manager.dart';

class AppPage {
  static final pages = [
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.splash,
      page: () => Splash(
        customWidget: ScreenOptions(),
      ),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.screenOptions,
      page: () => ScreenOptions(),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.register,
      binding: RegisBinding(),
      page: () => Register(),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.login,
      binding: LoginBinding(),
      page: () => Login(),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.homeSplash,
      page: () => Splash(
        customWidget: Home(),
      ),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.home,
      binding: HomeBinding(),
      page: () => Home(),
    ),
  ];
}
