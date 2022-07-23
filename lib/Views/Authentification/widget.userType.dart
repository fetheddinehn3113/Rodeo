import 'package:flutter/material.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';

import '../../Controllers/Authentification/controller.userType.dart';
import '../../Data/font.data.dart';
import '../Component/component.button.dart';
import '../Component/component.decorationContainer.dart';
import 'Component/component.typeModel.dart';
import 'package:get/get.dart';

class UserTypeWidget extends StatefulWidget {
  const UserTypeWidget({Key? key}) : super(key: key);

  @override
  _UserTypeWidgetState createState() => _UserTypeWidgetState();
}

class _UserTypeWidgetState extends State<UserTypeWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserTypeController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Text("Login",
                style: TextStyle(
                    fontSize: 14.sp, fontWeight: medium, color: Colors.white))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Expanded(
              child: Container(
            height: 100.h,
            width: 100.w,
            decoration: decorationContainerModel,
            child: Column(
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Welcome back",
                          style:
                              TextStyle(fontSize: 14.sp, fontWeight: semiBold),
                        ))),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<UserTypeController>(
                            init: controller,
                            builder: (context) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(flex: 2, child: SizedBox()),
                                  InkWell(
                                    onTap: () {
                                      controller.changeType("Driver");
                                    },
                                    child: typeModelWidget(
                                        controller.selected("Driver"),
                                        "Driver"),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  InkWell(
                                    onTap: () {
                                      controller.changeType("User");
                                    },
                                    child: typeModelWidget(
                                        controller.selected("User"), "User"),
                                  ),
                                  const Expanded(flex: 2, child: SizedBox()),
                                ],
                              );
                            }),
                      ],
                    )),
                Expanded(
                    child: Column(
                  children: [
                    buttonModel("Continue", () {}),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
