import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget typeModelWidget(bool selected, String title) => Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Stack(
            children: [
              Positioned(
                  height: 3.h,
                  right: 2.sp,
                  child: SvgPicture.asset(
                    selected
                        ? "assets/icons/Check.svg"
                        : "assets/icons/CheckDesable.svg",
                    height: 13.sp,
                    width: 13.sp,
                  ))
            ],
          ),
          height: 110.sp,
          width: 110.sp,
          decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(
                  color: selected ? Color(0xff6C6C6C) : Colors.white,
                  width: 1.sp)),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10.sp),
        )
      ],
    );
