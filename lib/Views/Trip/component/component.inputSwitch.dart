import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';



Widget inputSwitch(String icon, String title) {
  final controller = AddTripController();
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffBDBDBD)),
      color: const Color(0xffF6F6F6),
      borderRadius: BorderRadius.circular(5.sp),
    ),
    child: Obx(
      () => SwitchListTile(
        secondary: SvgPicture.asset(
          "assets/icons/$icon.svg",
          height: 17.sp,
          width: 17.sp,
        ),
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text(
            title,
            style: TextStyle(fontSize: 9.sp),
          ),
        ),
        value: controller.switchDriverBool.value,
        onChanged: controller.switchDriver,
      ),
    ),
  );
}
