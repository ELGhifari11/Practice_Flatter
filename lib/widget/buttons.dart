import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/screens/login.dart';
import 'package:flatter_project/screens/register.dart';
import 'package:flutter/material.dart';

class Tombol extends StatefulWidget {
  const Tombol({
    super.key,
  });

  @override
  State<Tombol> createState() => _TombolState();
}

class _TombolState extends State<Tombol> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Buttons(
              context: context,
              title: 'Scan ID',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Register(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              panjang: 250),
          Buttons(
              context: context,
              title: 'Masuk',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Login(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              panjang: 250),
          Buttons(
              context: context,
              title: 'Daftar',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Register(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              panjang: 250)
        ],
      ),
    );
  }
}

// //////////////////////////////////////////////////////////////////////////

class Buttons extends StatefulWidget {
  final BuildContext context;
  final String title;
  final Function onTap;
  final double panjang;

  const Buttons(
      {required this.context,
      required this.title,
      required this.onTap,
      required this.panjang});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.panjang,
      height: 55,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
          widget.title,
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
