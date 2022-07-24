import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodeo/Controllers/Authentification/controller.chat.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../Data/palette.data.dart';

Widget input(){
  final controller = Get.find<ChatController>();
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(50.sp)),
      height: 50.sp,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 7.sp),
        child: Row(
          children: [
            /* Container(
              padding: EdgeInsets.all(14.sp),
              height: 40.sp,
              width: 40.sp,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff4675C0)),
              child: SvgPicture.asset(
                  "assets/icons/Plus.svg"),
            ),*/
            SizedBox(width: 2.w),
            Expanded(
                child: TextField(
                  controller: controller.msgController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}