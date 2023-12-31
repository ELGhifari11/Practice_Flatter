import 'package:flutter/material.dart';
import 'package:flatter_project/colors/colors.dart';

class ButtonLogin extends StatefulWidget {
  final BuildContext context;
  final bool isLogin;
  final Function onTap;

  const ButtonLogin(
      {required this.context, required this.isLogin, required this.onTap});

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        gradient: LinearGradient(
          begin: FractionalOffset(0, 2),
          end: FractionalOffset(2, 2),
          colors: [Colors.red, AppColors.primaryColor],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          widget.onTap();
        },
        child: Text(
          widget.isLogin ? 'Masuk' : 'Daftar',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return Colors.white70;
            return Colors.transparent; // Set to transparent
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
