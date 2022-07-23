import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodeo/Controllers/Authentification/controller.logIn.dart';
import 'package:rodeo/Views/BottomBar/widget.bottomBar.dart';

import 'package:sizer/sizer.dart';

import '../../Data/font.data.dart';
import '../../Data/palette.data.dart';
import '../Component/component.button.dart';
import '../Component/component.decorationContainer.dart';
import 'Component/component.input.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                          "Register",
                          style:
                              TextStyle(fontSize: 14.sp, fontWeight: semiBold),
                        ))),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Phone",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Phone',
                              isString: false,
                              hintText: 'your phone number',
                              textEditingController:
                                  controller.phoneNumberController,
                              validate: controller.validatePhoneNumber,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Password',
                              isString: true,
                              hintText: 'your password',
                              textEditingController:
                                  controller.passwordController,
                              validate: controller.validatePhoneNumber,
                              isPassword: true,
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Column(
                  children: [
                    buttonModel("Continue", () {
                      Get.offAll(() => BottomBarWidget());
                    }),
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
