import 'package:flutter/material.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:sizer/sizer.dart';

import '../../../Data/palette.data.dart';
import '../../Component/component.circlePic.dart';

Widget msgModel(bool sender, String text) => Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        sender
            ? SizedBox(
                height: 30.sp,
                width: 30.sp,
              )
            : circlePicModel(30.sp,
                pic,Colors.white),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            decoration: BoxDecoration(
                color: sender ? secondaryColor : greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.sp),
                  topLeft: Radius.circular(10.sp),
                  bottomRight: Radius.circular(sender ? 0.sp : 10.sp),
                  bottomLeft: Radius.circular(!sender ? 0.sp : 10.sp),
                )),
            child: Text(
              text,
              style: TextStyle(color: sender ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
