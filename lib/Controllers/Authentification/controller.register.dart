import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController{
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late File imageFile;
  var imageFromLocal = false;

  void picPicture() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      imageFromLocal = true;
    }
    update();
  }

  String? validatePhoneNumber(String? phone){
    return null;
  }
  String? validateFirstName(String? name){
    return null;
  }
  String? validateLastName(String? phone){
    return null;
  }
}