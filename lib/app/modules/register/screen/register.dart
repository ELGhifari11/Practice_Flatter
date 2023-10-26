import 'dart:io';
import 'package:flatter_project/app/modules/register/controllers/regisController.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/app/controllers/authControllers.dart';
import 'package:flatter_project/widget/dialogCustom/customDialog.dart';
import 'package:flatter_project/widget/loginButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class Register extends GetView<RegisController> {
  final _formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();

  void register(BuildContext context) {
    if (controller.emailC.text == '' ||
        controller.passC.text == '' ||
        controller.passValidC.text == '' ||
        controller.nameC.text == '' ||
        controller.dateC.text == '') {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Oops! Ada yang belum di isi',
              iconTitle: Icons.warning)));
    } else if (controller.passC.text != controller.passValidC.text) {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Pastikan password yang anda masukan sesuai',
              iconTitle: Icons.warning)));
    } else if (!controller.emailC.toString().contains('@gmail.com')) {
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
        authC.register(controller.emailC.text, controller.passC.text, context);
      }
    }
  }

  void getImage(ImageSource source, BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      controller.image.value = File(pickedImage.path);
    }
    Navigator.pop(context);
  }

  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CustomAlertAction(
            content: 'Ambil gambar dari ...',
            iconTitle: Icons.camera_alt,
            button1: () => getImage(ImageSource.camera, context),
            button2: () => getImage(ImageSource.gallery, context),
            childButton1: Icon(Icons.camera_alt, color: AppColors.primaryColor),
            childButton2: Icon(Icons.image, color: AppColors.primaryColor)));
  }

  var pressed = false.obs;

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
                child: Obx(() => Column(children: [
                      SizedBox(height: 30),
                      GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          pressed.value = false;
                        },
                        onTapUp: (TapUpDetails details) {
                          pressed.value = true;

                          showDialogBox(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: !pressed.value ? 320 : 300,
                          height: !pressed.value ? 270 : 250,
                          decoration: BoxDecoration(
                            borderRadius: !pressed.value
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
                            // ignore: unnecessary_null_comparison
                            image: controller.image != null &&
                                    controller.image.value != null
                                ? DecorationImage(
                                    image: FileImage(
                                        controller.image.value as File),
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
                                  controller: controller.nameC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomField(
                                  text: 'Tanggal lahir',
                                  icon: Icons.date_range,
                                  controller: controller.dateC,
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
                                  controller: controller.emailC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomTextField(
                                  text: 'Kata sandi',
                                  icon: Icons.lock,
                                  isPasswordType: true,
                                  controller: controller.passC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomTextField(
                                  text: 'Ulangi kata sandi',
                                  icon: Icons.lock,
                                  isPasswordType: true,
                                  controller: controller.passValidC,
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
                                register(context);
                              })),
                    ])))
          ],
        ),
      ),
    );
  }
}
