import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

Widget containerTimeModel(String icon, String title, int index) {
  final controller = Get.find<AddTripController>();
  bool selected = controller.isDateSelected(index);
  return InkWell(
    onTap: () {
      controller.updateDateSelected(index);
      if(index==1){
        controller.pickTime(2);
      }
    },
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border:
              Border.all(color: selected ? secondaryColor : Color(0xffBDBDBD)),
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/$icon.svg",
              height: 14.sp,
              width: 14.sp,
            ),
            Visibility(
              visible: title.isNotEmpty,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}
