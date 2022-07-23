import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

Widget pickDay() {
  return Container(
    height: 22.h,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffBDBDBD)),
      borderRadius: BorderRadius.circular(11.sp),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: containerCustomOnly("Only this day", 0)),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(child: containerCustomOnly("Custom days", 1)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      weekDays.map((day) => containerDayWeek(day)).toList()),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.sp),
                bottomRight: Radius.circular(11.sp)),
          ),
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(
                  color: Colors.white, fontSize: 14.sp, fontWeight: semiBold),
            ),
          ),
        ))
      ],
    ),
  );
}

Widget containerCustomOnly(String title, int index) {
  final controller = Get.find<AddTripController>();
  bool selected = controller.isOnlyCustomSelected(index);
  return InkWell(
    onTap: () {
      controller.updateOnlyCustomSelected(index);
    },
    child: AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          border: Border.all(
              color: selected ? secondaryColor : const Color(0xffBDBDBD)),
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: Text(title, style: TextStyle(fontSize: 10.sp)),
        )),
  );
}

Widget containerDayWeek(String day) {
  final controller = Get.find<AddTripController>();
  bool selected = controller.isDaySelected(day);
  return InkWell(
    onTap: (){
      controller.switchSelectedDay(day);
    },
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 30.sp,
        height: 30.sp,
        padding: EdgeInsets.all(3.sp),
        decoration: BoxDecoration(
          border: Border.all(color:selected ? secondaryColor :  const Color(0xffBDBDBD)),
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: Center(
          child: Text(day, style: TextStyle(fontSize: 10.sp)),
        )),
  );
}
