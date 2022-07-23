import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Controllers/Bottombar/controller.bottomBar.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';

import 'component/component.BottomBarItemModel.dart';
import 'package:get/get.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    return SafeArea(
        child: GetBuilder<BottomBarController>(
          init: controller,
          builder: (context) {
            return Scaffold(
      backgroundColor: primaryColor,
      appBar: controller.currentAppBar(),
      body: controller.currentWidget(),
      bottomNavigationBar: Container(
            width: 100.w,
            height: 7.h,
            color: greyColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomBarItem("Arrow", 0),
                bottomBarItem("Chat", 1),
                bottomBarItem("PersonBottomBar", 2),
              ],
            ),
      ),
    );
          }
        ));
  }
}
