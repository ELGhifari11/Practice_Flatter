import 'package:flatter_project/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatefulWidget {
  late String image;

  CustomIconButton({this.image = 'lib/images/chat.png'});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          pressed = true;
          print('Container ditekan!');
        });
        Future.delayed(Duration(milliseconds: 150), () {
          setState(() {
            pressed = false;
          });
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: pressed ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(90),
          border: Border.all(
            color: pressed ? AppColors.primaryColor : Colors.black12,
            width: 3,
          ),
        ),
        child: Image(
          image: AssetImage(widget.image),
        ),
      ),
    );
  }
}
