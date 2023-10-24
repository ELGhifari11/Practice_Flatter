import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/routes/routeName.dart';
import 'package:flatter_project/widget/dialogCustom/customDialog.dart';
import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _passwordVerifikasiTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _namaTextController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();

  void _register() {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();
    String validatePass = _passwordVerifikasiTextController.text.trim();
    String nama = _namaTextController.text.trim();
    String date = _dateTextController.text.trim();

    void _handleSignUp() async {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.offNamed(
          Routename.login,
        );
        print('terdaftar sebagai : ${userCredential.user!.email} ');
        Fluttertoast.showToast(
          msg: 'Daftar berhasil',
          gravity: ToastGravity.TOP,
        );
      } catch (e) {
        if (e.toString().contains('weak-password')) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                  content: 'Password minimal 6 karakter',
                  iconTitle: Icons.warning);
            },
          );
        }
      }
    }

    if (email.isEmpty ||
        password.isEmpty ||
        validatePass.isEmpty ||
        nama.isEmpty ||
        date.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Oops! Ada yang belum di isi',
              iconTitle: Icons.warning)));
    } else if (password != validatePass) {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Oops! Pastikan password yang anda masukan sesuai',
              iconTitle: Icons.warning)));
    } else if (!email.contains('@gmail.com')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            content: 'Email tidak valid. Harap masukkan email yang valid.',
            iconTitle: Icons.warning,
          );
        },
      );
    } else {
      if (_formKey.currentState!.validate()) {
        _handleSignUp();
      }
    }
  }

  File? image;

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) setState(() => image = File(pickedImage.path));
    Navigator.pop(context);
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
        backgroundColor: AppColors.secondaryColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.camera_alt, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.image, color: Colors.white)
        ]),
        iconColor: Colors.white,
        content:
            Text('Ambil gambar dari ..', style: TextStyle(color: Colors.white)),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                backgroundColor: Colors.white),
            onPressed: () => getImage(ImageSource.camera),
            child: Icon(Icons.camera_alt, color: AppColors.primaryColor),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                backgroundColor: Colors.white),
            onPressed: () => getImage(ImageSource.gallery),
            child: Icon(Icons.image, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/images/bgg.png'),
          fit: BoxFit.cover,
        )),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text('Daftar', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black.withOpacity(0.3),
              floating: true,
              snap: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(background: Container()),
            ),
            SliverToBoxAdapter(
                child: Column(children: [
              SizedBox(height: 30),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    _pressed = true;
                  });
                },
                onTapUp: (TapUpDetails details) {
                  setState(() {
                    _pressed = false;
                  });
                  showDialogBox();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: !_pressed ? 320 : 300,
                  height: !_pressed ? 270 : 250,
                  decoration: BoxDecoration(
                    borderRadius: !_pressed
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(5),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                    image: image != null
                        ? DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: AssetImage('lib/images/icon1.png'),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        child: CustomTextField(
                          text: 'Nama',
                          icon: Icons.person,
                          isPasswordType: false,
                          controller: _namaTextController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: CustomField(
                          text: 'Tanggal lahir',
                          icon: Icons.date_range,
                          controller: _dateTextController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: CustomFieldGender(
                          text: '     ',
                          icon: Icons.people,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: CustomTextField(
                          text: 'Email',
                          icon: Icons.email,
                          isPasswordType: false,
                          controller: _emailTextController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: CustomTextField(
                          text: 'Kata sandi',
                          icon: Icons.lock,
                          isPasswordType: true,
                          controller: _passwordTextController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: CustomTextField(
                          text: 'Ulangi kata sandi',
                          icon: Icons.lock,
                          isPasswordType: true,
                          controller: _passwordVerifikasiTextController,
                        ),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                  child: ButtonLogin(
                      context: context,
                      isLogin: false,
                      onTap: () {
                        _register();
                      })),
            ]))
          ],
        ),
      ),
    );
  }
}
