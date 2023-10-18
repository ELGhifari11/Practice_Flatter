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
          Container(
            width: 230,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white54)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.primaryColor)),
              onPressed: () {
                // Masukkan fungsi untuk login di sini
              },
              child: Text(
                'Scan ID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),

          SizedBox(height: 20), // Memberikan jarak antar tombol
          Container(
            width: 230,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white54)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.primaryColor)),
              onPressed: () {
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
              child: Text(
                'Masuk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 20), // Memberikan jarak antar tombol
          Container(
            width: 230,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white54)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.primaryColor)),
              onPressed: () {
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
              child: Text(
                'Daftar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
