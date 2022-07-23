import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodeo/Controllers/Bottombar/controller.bottomBar.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../Data/palette.data.dart';

Widget bottomBarItem(String icon, int index) {
  final controller = Get.find<BottomBarController>();
  bool selected = controller.isSelected(index);
  return InkWell(
    onTap: (){
      controller.updateSelected(index);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      width: 17.w,
      height: double.infinity,
      decoration: BoxDecoration(
          border: selected
              ? Border(top: BorderSide(width: 2.sp, color: secondaryColor))
              : const Border()),
      child: SvgPicture.asset(
        'assets/icons/$icon.svg',
        color: selected ? Colors.black : const Color(0xff838383),
      ),
    ),
  );
}
