import 'package:get/get.dart';

class CompanyTypeController extends GetxController{
  String type = "Company";

  changeType(String type){
    this.type = type;
    update();
  }

  bool selected(String type){
    return type == this.type;
  }
}