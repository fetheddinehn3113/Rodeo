import 'package:flutter/material.dart';
import 'package:rodeo/Controllers/Authentification/controller.userType.dart';
import 'package:rodeo/Controllers/Authentification/controller.welcomePage.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Authentification/widget.logIn.dart';
import 'package:rodeo/Views/Authentification/widget.register.dart';
import 'package:rodeo/Views/Authentification/widget.userType.dart';
import 'package:rodeo/Views/Component/component.button.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomePageController());
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonModel("Create an Account".tr, () {
                Get.to(()=> const UserTypeWidget());
              }),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ".tr,
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(()=>const LogInWidget());
                    },
                    child: Text(
                      "Sign In".tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: secondaryColor,
                          fontWeight: semiBold),
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    ));
  }
}
