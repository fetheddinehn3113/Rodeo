import 'package:flutter/material.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:sizer/sizer.dart';

import '../../../Data/font.data.dart';
import '../../../Data/palette.data.dart';
import 'package:get/get.dart';

Widget pickTime() {
  final controller = Get.find<AddTripController>();
  return Container(
    height: 20.h,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffBDBDBD)),
      borderRadius: BorderRadius.circular(11.sp),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20.sp,
                child: Stack(
                  children: [
                    Center(
                      child: Divider(
                        thickness: 2.sp,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.pickTime(0);
                            },
                            child: Container(
                                height: 20.sp,
                                width: 20.sp,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFDADADA))),
                          ),
                          VerticalDivider(
                            indent: 1.h,
                            endIndent: 1.h,
                            color: Colors.black,
                            thickness: 1.sp,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pickTime(1);
                            },
                            child: Container(
                                height: 20.sp,
                                width: 20.sp,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFDADADA))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(controller.firstTimeFormat(),style : TextStyle(fontSize: 10.sp),),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1.sp,
                  ),
                  Text(controller.secondTimeFormat(),style : TextStyle(fontSize: 10.sp),),
                ],
              ),
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
