import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_project/routes/routeName.dart';
import 'package:flatter_project/widget/dialogCustom/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(
        msg: 'Login berhasil',
        gravity: ToastGravity.TOP,
      );
      Get.offAllNamed(Routename.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Email tidak valid \nHarap masukkan email yang valid.',
                iconTitle: Icons.warning);
          },
        );
      } else if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.toString().contains('INVALID_LOGIN_CREDENTIALS')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Email atau kata sandi salah \nCoba lagi.',
                iconTitle: Icons.warning);
          },
        );
      }
    }
  }

  void register() {}

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routename.splash);
  }
}
