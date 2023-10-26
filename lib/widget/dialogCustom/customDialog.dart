import 'package:flutter/material.dart';
import 'package:flatter_project/colors/colors.dart';

class CustomAlertDialog extends StatefulWidget {
  final String content;
  final IconData iconTitle;

  const CustomAlertDialog({
    required this.content,
    required this.iconTitle,
  });

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconTitle,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ],
      ),
      content: Text(
        widget.content,
        style: TextStyle(color: AppColors.primaryColor),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: TextStyle(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}

// /////////////////////////////////////////////////////////////////////////////////////////

class CustomAlertAction extends StatefulWidget {
  final String content;
  final IconData iconTitle;
  final VoidCallback? button1;
  final VoidCallback? button2;
  final Widget childButton1;
  final Widget childButton2;

  const CustomAlertAction({
    required this.content,
    required this.iconTitle,
    required this.button1,
    required this.button2,
    required this.childButton1,
    required this.childButton2,
  });

  @override
  _CustomAlertActionState createState() => _CustomAlertActionState();
}

class _CustomAlertActionState extends State<CustomAlertAction> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(widget.iconTitle, color: AppColors.primaryColor),
      ]),
      iconColor: Colors.white,
      content:
          Text(widget.content, style: TextStyle(color: AppColors.primaryColor)),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: Colors.white),
          onPressed: widget.button1,
          child: widget.childButton1,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: Colors.white),
          onPressed: widget.button2,
          child: widget.childButton2,
        ),
      ],
    );
  }
}
