import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodeo/Views/Chat/widget.chat.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../Data/const.data.dart';
import '../../../Data/font.data.dart';
import '../../Component/component.circlePic.dart';

Widget itemGuestList()=>ListTile(
  onTap: (){
    Get.to(()=>const ChatWidget());
  },
  leading: circlePicModel(33.sp, pic, Colors.white),
  title: Text(
    "Gavin potter",
    style: TextStyle(fontSize: 11.sp, fontWeight: semiBold),
  ),
  trailing: SvgPicture.asset(
    "assets/icons/ChatGuestList.svg",
    height: 14.sp,
    width: 14.sp,
  ),
);