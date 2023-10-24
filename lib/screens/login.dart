import 'package:flatter_project/controllers/authControllers.dart';
import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
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
