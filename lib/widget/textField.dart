import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;

  const CustomTextField({
    required this.text,
    required this.icon,
    required this.isPasswordType,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  void initState() {
    super.initState();
    isObscure = widget.isPasswordType; // Set isObscure sesuai tipe TextField
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isObscure,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          minWidth: 70,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white60,
        ),
        suffixIcon: widget.isPasswordType
            ? Container(
                constraints: BoxConstraints(minWidth: 70),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  color: isObscure ? Colors.white60 : Colors.white,
                ),
              )
            : null,
        labelText: widget.text,
        labelStyle: TextStyle(color: Colors.white60),
        filled: true,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        fillColor: Color(0xFF0E3241),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
