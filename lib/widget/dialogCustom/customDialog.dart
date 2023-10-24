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
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconTitle,
            color: AppColors.primaryColor,
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
          ),
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: TextStyle(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
