import 'package:flutter/material.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Views/Component/component.circlePic.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Data/font.data.dart';

Widget reviewModel() => Row(

  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    circlePicModel(40.sp, pic, Colors.white),
    SizedBox(width: 5.w),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            "Fetheddine",
            style: TextStyle(fontSize: 12.sp, fontWeight: medium),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h),
            child: Row(
              children: const [
                Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffF3A100),
                ),
                Icon(
                  Icons.star_outline_rounded,
                  color: Color(0xffF3A100),
                ),
                Icon(
                  Icons.star_outline_rounded,
                  color: Color(0xffF3A100),
                ),
                Icon(
                  Icons.star_outline_rounded,
                  color: Color(0xffF3A100),
                )
              ],
            ),
          ),
          Text(
            "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.",
            style: TextStyle(fontSize: 10.sp,fontWeight: light),
          )
        ],
      ),
    )
  ],
);