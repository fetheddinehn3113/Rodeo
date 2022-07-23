import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Data/palette.data.dart';

Container stepModelWidget(bool active) => Container(
      height: 12.sp,
      width: 12.sp,
      decoration: BoxDecoration(
          border: Border.all(color: active ? Colors.white : const Color(0xff6C6C6C)),
          color: active ? primaryColor : const Color(0xff6C6C6C),
          shape: BoxShape.circle),
    );
