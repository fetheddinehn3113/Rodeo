import 'package:flutter/material.dart';
import '../../../Data/palette.data.dart';
import '../../../data/font.data.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

class InputComponentTrip extends StatelessWidget {
  String leadingIcon;
  String suffixICon;
  String hintText;
  TextEditingController textEditingController;
  Function() onTap;


  InputComponentTrip(
      {required this.suffixICon,
      required this.leadingIcon,
      required this.textEditingController,
      required this.hintText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: true,
      cursorColor: primaryColor,
      controller: textEditingController,
      style: TextStyle(fontSize: 10.sp, fontWeight: regular),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 0.0),
        suffixIcon:Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: SvgPicture.asset("assets/icons/$suffixICon.svg",color: primaryColor,
              height:10.sp ,width:10.sp ,),
          ),

        ]) ,
        prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: SvgPicture.asset("assets/icons/$leadingIcon.svg",color: primaryColor,
            height:10.sp ,width:10.sp ,),
          ),

        ]),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 50.w,
        ),
        filled: true,
        fillColor: const Color(0xffF6F6F6),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide: BorderSide(color: primaryColor, width: 1.sp)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide:
                BorderSide(color: const Color(0xffBDBDBD), width: 0.5.sp)),
      ),
    );
  }
}
