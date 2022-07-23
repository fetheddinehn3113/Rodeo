import 'package:flutter/material.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';
Widget buttonModel(String title, VoidCallback? function) => SizedBox(
  width: 60.w,
  child:   TextButton(
    onPressed: function,
    style:
    TextButton.styleFrom(
      shape:RoundedRectangleBorder( // <--- use this
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      backgroundColor: primaryColor,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.white,fontWeight: medium,fontSize: 11.sp),
    ),
  ),
);
