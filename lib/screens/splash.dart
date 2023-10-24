// import 'package:flatter_project/screens/optionButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  final Widget customWidget;
  Splash({required this.customWidget});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.off(
        () => customWidget,
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 33, 33),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/bgg.png'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('lib/images/car.png'),
                height: 200,
              ),
              GetPlatform.isAndroid
                  ? CupertinoActivityIndicator(
                      color: Color.fromARGB(255, 255, 255, 255),
                      radius: 20,
                      animating: true,
                    )
                  : CircularProgressIndicator(
                      color: Colors.amber,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
