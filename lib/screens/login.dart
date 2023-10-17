import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                      ButtonLogin(context: context, isLogin: true, onTap: () {})
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
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
