import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodeo/Views/Home/widget.home.dart';
import 'package:rodeo/Views/Profile/MyProfile/component/component.appBar.dart';
import 'package:rodeo/Views/guestList/widget.gestList.dart';

import '../../Views/Home/component/component.appBar.dart';
import '../../Views/Profile/MyProfile/widget.profile.dart';
import '../../Views/guestList/component/component.appBar.dart';

class BottomBarController extends GetxController {
  int selected = 0;
  List<Widget> widgets = [
    const HomeWidget(),
    const GuestListWidget(),
    const ProfileWidget()
  ];

  List<AppBar> appBars = [
    appBarHome(),
    appBarGuestList(),
    appBarProfile()
  ];

  updateSelected(int index) {
    selected = index;
    update();
  }

  bool isSelected(int index) {
    return selected == index;
  }

  Widget currentWidget() {
    return widgets[selected];
  }
  AppBar currentAppBar() {
    return appBars[selected];
  }
}
