import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarController extends GetxController{
  TextEditingController carTypeController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController yearCarController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List colors = ["red","orange","black"];


  String? validateCarType(String? carType){
    return null;
  }
  String? validateRegistrationNumber(String? registrationNumber){
    return null;
  }
  String? validateYearCar(String? yearCar){
    return null;
  }
}