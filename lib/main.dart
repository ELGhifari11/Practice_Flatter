import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColors.primaryColor, // warna untuk header
          onPrimary: Colors.white, // warna teks di header
          surface: Colors.purple, // background dialog
          onSurface: Colors.black, // warna untuk teks dan icon
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary:
                  AppColors.primaryColor), // Warna untuk tombol OK dan CANCEL
        ),
      ),
      home: Splash(),
    );
  }
}
