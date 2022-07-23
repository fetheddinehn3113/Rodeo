import 'package:flutter/material.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';

Widget itemModel(String title, String subTitle) => ListTile(
  contentPadding: subTitle.isEmpty ?  EdgeInsets.symmetric(vertical: 1.h) : EdgeInsets.zero,
      leading: Container(
        width: 45.sp,
        height: 45.sp,
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(9.sp),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 10.sp, fontWeight: semiBold),
      ),
      subtitle: subTitle.isEmpty
          ? null
          : Text(subTitle,
              style: TextStyle(fontSize: 9.sp, fontWeight: light)),
      trailing: Container(
        height: 20.sp,
        width: 20.sp,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: greyColor),
      ),
    );
