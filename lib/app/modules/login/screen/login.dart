import 'package:flatter_project/app/controllers/authControllers.dart';
import 'package:flatter_project/app/modules/login/controllers/loginController.dart';
import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_element
class Login extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

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
                          controller: controller.emailC,
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          text: 'Kata sandi',
                          icon: Icons.lock,
                          isPasswordType: true,
                          controller: controller.passC,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              'Lupa password',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ButtonLogin(
                          context: context,
                          isLogin: true,
                          onTap: () {
                            // _login(context);
                            authC.login(controller.emailC.text,
                                controller.passC.text, context);
                          },
                        ),
                      ],
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
