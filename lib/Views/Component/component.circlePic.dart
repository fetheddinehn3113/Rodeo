import 'package:flutter/material.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';

Widget circlePicModel(double size, String pic,Color color)=>Container(
  height: size,
  width: size,
  decoration:
   BoxDecoration( color: color),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20.h),
    child: Image.network(
       pic),
  ),
);