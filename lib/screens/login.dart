import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_project/controllers/authControllers.dart';
import 'package:flatter_project/routes/routeName.dart';
import 'package:flatter_project/widget/dialogCustom/customDialog.dart';
import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _password = TextEditingController();

  final authC = Get.find<AuthController>();

  // void _login(BuildContext context) async {
  //   String email = _email.text.trim();
  //   String password = _password.text.trim();

  //   // try {
  //   //   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //   //     email: email,
  //   //     password: password,
  //   //   );
  //   //   User? user = userCredential.user;
  //   //   print('Logged in as: ${user?.email}');
  //   //   Fluttertoast.showToast(
  //   //     msg: 'Login berhasil',
  //   //     gravity: ToastGravity.TOP,
  //   //   );
  //   //   Get.offAllNamed(Routename.home);
  //   // } on FirebaseAuthException catch (e) {
  //   //   if (e.code == 'invalid-email') {
  //   //     showDialog(
  //   //       context: context,
  //   //       builder: (BuildContext context) {
  //   //         return CustomAlertDialog(
  //   //             content: 'Email tidak valid \nHarap masukkan email yang valid.',
  //   //             iconTitle: Icons.warning);
  //   //       },
  //   //     );
  //   //   } else if (e.code == 'user-not-found' ||
  //   //       e.code == 'wrong-password' ||
  //   //       e.toString().contains('INVALID_LOGIN_CREDENTIALS')) {
  //   //     showDialog(
  //   //       context: context,
  //   //       builder: (BuildContext context) {
  //   //         return CustomAlertDialog(
  //   //             content: 'Email atau kata sandi salah \nCoba lagi.',
  //   //             iconTitle: Icons.warning);
  //   //       },
  //   //     );
  //   //   }
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/bgg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  25, MediaQuery.of(context).size.height * 0.2, 25, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/images/car.png',
                            height: 200,
                          ),
                          SizedBox(height: 30),
                          CustomTextField(
                            text: 'Email',
                            icon: Icons.email,
                            isPasswordType: false,
                            controller: _email,
                          ),
                          SizedBox(height: 25),
                          CustomTextField(
                            text: 'Kata sandi',
                            icon: Icons.lock,
                            isPasswordType: true,
                            controller: _password,
                          ),
                          SizedBox(height: 25),
                          ButtonLogin(
                            context: context,
                            isLogin: true,
                            onTap: () {
                              // _login(context);
                              authC.login(_email.text, _password.text, context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                15, MediaQuery.of(context).size.height * 0.06, 0, 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
