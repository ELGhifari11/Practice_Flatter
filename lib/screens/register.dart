import 'dart:io';

import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _passwordVerifikasiTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _namaTextController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();

  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      // Tambahkan pengecekan ini
      image = File(imagePicked.path);
      setState(() {});
    }
  }

  Future getGaleri() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photoPicked =
        await _picker.pickImage(source: ImageSource.gallery);

    if (photoPicked != null) {
      // Tambahkan pengecekan ini
      image = File(photoPicked.path);
      setState(() {});
    }
  }

  bool _pressed = false;
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
        backgroundColor: AppColors.primaryColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.camera_alt, color: Colors.white),
          SizedBox(width: 10),
          // memberikan jarak antara dua ikon
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
            onPressed: () {
              getImage();
              Navigator.pop(context);
            },
            child: Icon(Icons.camera_alt, color: AppColors.primaryColor),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                backgroundColor: Colors.white),
            onPressed: () {
              getGaleri();
              Navigator.pop(context);
            },
            child: Icon(Icons.image, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/bgg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Container(
                  child: Center(
                      child: Column(
            children: [
              SizedBox(height: 130),
              GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                // onTap: () {
                //   _onTap();
                //   print('Container ditekan!');
                // },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 50),
                  width: !_pressed ? 320 : 310,
                  height: !_pressed ? 170 : 160,
                  decoration: BoxDecoration(
                    borderRadius: !_pressed
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(5),
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
                        // Tambahkan pengecekan ini
                        : DecorationImage(
                            image: AssetImage('lib/images/icon1.png'),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
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
          )))),
          Container(
              padding: EdgeInsets.fromLTRB(
                  15, MediaQuery.of(context).size.height * 0.06, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
