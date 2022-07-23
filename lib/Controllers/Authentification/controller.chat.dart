import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  TextEditingController msgController = TextEditingController();


  RxList<MessageModel> messages = <MessageModel>[MessageModel(msg: "hello", sender: false),
  MessageModel(msg: "I m here", sender: false)].obs;

  sendMsg(){
    messages.insert(messages.length, MessageModel(msg: msgController.text, sender: true));
    msgController.clear();
  }
}

class MessageModel{
  String msg;
  bool sender;

  MessageModel({required this.msg,required this.sender});
}