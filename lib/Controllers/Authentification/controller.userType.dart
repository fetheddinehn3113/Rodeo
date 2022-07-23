import 'package:get/get.dart';

class UserTypeController extends GetxController{
  String type = "User";

  changeType(String type){
    this.type = type;
    update();
  }

  bool selected(String type){
    return type == this.type;
  }
}