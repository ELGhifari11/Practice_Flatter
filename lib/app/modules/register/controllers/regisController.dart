import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: 'ketikemail@gmail.com');
  TextEditingController passC = TextEditingController();
  TextEditingController passValidC = TextEditingController();
  TextEditingController nameC = TextEditingController(text: 'Contoh Nama');
  TextEditingController dateC = TextEditingController();
  Rx<File?> image = Rx<File?>(null);

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    passValidC.dispose();
    nameC.dispose();
    dateC.dispose();
    super.onClose();
  }
}
