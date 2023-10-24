import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/controllers/authControllers.dart';
import 'package:flatter_project/routes/pageRoute.dart';
import 'package:flatter_project/routes/routeName.dart';
import 'package:flatter_project/screens/home.dart';
import 'package:flatter_project/screens/optionButtons.dart';
import 'package:flatter_project/screens/splash.dart';
import 'package:flatter_project/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print('ini Snapshot ${snapshot.data} ');

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
                textButtonTheme: TextButtonThemeData(
                    style:
                        TextButton.styleFrom(primary: AppColors.primaryColor)),
              ),
              initialRoute:
                  snapshot.data != null ? Routename.home : Routename.splash,
              // home: snapshot.data != null
              //     ? Splash(customWidget: Home())
              //     : Splash(customWidget: ScreenOptions()),
              getPages: AppPage.pages,
            );
          }
          return Splash(
            customWidget: Home(),
          );
        });
  }
}
