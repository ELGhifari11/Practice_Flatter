import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_project/app/routes/routeName.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/widget/dialogCustom/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void login(String email, String password, BuildContext context) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        print('$email berhasil login');
        Fluttertoast.showToast(
          msg: '$email berhasil login',
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: AppColors.primaryColor,
        );

        Get.offAllNamed(Routename.home);
      } else if (!myUser.user!.emailVerified) {
        showDialog(
            context: context,
            builder: (BuildContext conntext) {
              return CustomAlertAction(
                  content:
                      'Email belum di verifikasi, Kirim ulang  verifikasi ?',
                  iconTitle: Icons.email,
                  button1: () => Get.back(),
                  button2: () async {
                    Get.back();
                    await Future.delayed(Duration(seconds: 2), () async {
                      await myUser.user!.sendEmailVerification();
                    });
                  },
                  childButton1: Text('NO'),
                  childButton2: Text('Kirim ulang'));
            });
      } else {
        Fluttertoast.showToast(
            msg: '$email Belum di verifikasi',
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.white,
            textColor: AppColors.primaryColor);
      }
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
          e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Email atau kata sandi salah \nCoba lagi.',
                iconTitle: Icons.warning);
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
              content: 'error terjadi tidak bisa login',
              iconTitle: Icons.warning);
        },
      );
    }
  }

// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void register(String email, String password, BuildContext context) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await myUser.user!.sendEmailVerification();
      showDialog(
          context: context,
          builder: (BuildContext conntext) {
            return CustomAlertAction(
                content:
                    'Silahkan verifikasi email yang kami kirim terlebih dahulu!',
                iconTitle: Icons.email,
                button1: () => {Get.offAndToNamed(Routename.register)},
                button2: () => {Get.back(), Get.back()},
                childButton1: Text('No'),
                childButton2: Text('OK'));
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Password minimal 6 karakter',
                iconTitle: Icons.warning);
          },
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Email sudah di gunakan', iconTitle: Icons.warning);
          },
        );
      }
    } catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
              content: 'Error gagal dapat mendaftar', iconTitle: Icons.warning);
        },
      );
    }
  }

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routename.splash);
  }
}
