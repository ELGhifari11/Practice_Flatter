import 'package:flatter_project/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;
  late Color borderColor;
  late Color borderFocusColor;

  CustomTextField({
    required this.text,
    required this.icon,
    this.isPasswordType = false,
    required this.controller,
    this.borderColor = Colors.white,
    this.borderFocusColor = AppColors.primaryColor,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  void initState() {
    super.initState();
    isObscure = widget.isPasswordType;
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
          color: Colors.white,
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
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.borderFocusColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: widget.borderColor),
        ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}

// /////////////////////////// DATE PICKER

class CustomField extends StatefulWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;

  const CustomField({
    required this.text,
    required this.icon,
    required this.controller,
  });

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextField(
          controller: widget.controller,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(
                minWidth: 70,
              ),
              prefixIcon: Icon(
                widget.icon,
                color: Colors.white,
              ),
              labelText: widget.text,
              labelStyle: TextStyle(color: Colors.white60),
              filled: true,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white),
              )),
        ),
      ),
    );
  }
}

// ///////  GENDER DROPDOWN

class CustomFieldGender extends StatefulWidget {
  final String text;
  final IconData icon;

  CustomFieldGender({
    required this.text,
    required this.icon,
  });

  @override
  _CustomFieldGenderState createState() => _CustomFieldGenderState();
}

class _CustomFieldGenderState extends State<CustomFieldGender> {
  String dropdownValue = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        width: MediaQuery.of(context).size.width * .9,
        height: 60,
        child: Row(children: <Widget>[
          Icon(widget.icon, color: Colors.white),
          SizedBox(width: 10.0),
          Text(widget.text, style: TextStyle(color: Colors.white)),
          Expanded(
              child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.secondaryColor,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                style: TextStyle(color: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  );
                }).toList(),
              ),
            ),
          ))
        ]));
  }
}
