import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

Widget back() => InkWell(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: SvgPicture.asset(
          "assets/icons/Back.svg",
        ),
      ),
    );
