import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  void _login() {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
          backgroundColor: AppColors.secondaryColor,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.warning,
              color: Colors.white,
            )
          ]),
          content: Text('Oops!  Ada yang belum di isi ..',
              style: TextStyle(color: Colors.white)),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                  backgroundColor: Colors.white),
              onPressed: () => Navigator.pop(context),
              child:
                  Text('OK', style: TextStyle(color: AppColors.primaryColor)),
            ),
          ],
        ),
      );
    }
  }

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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        controller: _emailTextController,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        text: 'Kata sandi',
                        icon: Icons.lock,
                        isPasswordType: true,
                        controller: _passwordTextController,
                      ),
                      SizedBox(height: 25),
                      ButtonLogin(
                          context: context,
                          isLogin: true,
                          onTap: () {
                            _login();
                          })
                    ],
                  ),
                ),
              ]),
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
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
