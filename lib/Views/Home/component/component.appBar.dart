import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodeo/Views/Trip/widget.trip.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
AppBar appBarHome() => AppBar(
  title:  Text("Dashboard".tr),
  actions: [
    InkWell(onTap: (){
      Get.to(()=>const TripWidget());
    },child: SvgPicture.asset("assets/icons/Plus.svg",height: 17.sp,width: 17.sp,)),
    SizedBox(width: 4.w,)
  ],
);