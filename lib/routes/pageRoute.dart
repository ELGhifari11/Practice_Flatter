import 'package:flatter_project/routes/routeName.dart';
import 'package:flatter_project/screens/home.dart';
import 'package:flatter_project/screens/login.dart';
import 'package:flatter_project/screens/optionButtons.dart';
import 'package:flatter_project/screens/register.dart';
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
      page: () => Register(),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.login,
      page: () => Login(),
    ),
    GetPage(
      transition: Transition.cupertinoDialog,
      transitionDuration: Duration(milliseconds: 500),
      name: Routename.home,
      page: () => Splash(
        customWidget: Home(),
      ),
    )
  ];
}
