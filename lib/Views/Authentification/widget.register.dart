import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rodeo/Controllers/Authentification/controller.register.dart';
import 'package:rodeo/Views/Authentification/widget.car.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../Data/font.data.dart';
import '../../Data/palette.data.dart';
import '../Component/component.button.dart';
import '../Component/component.decorationContainer.dart';
import 'Component/component.input.dart';
import 'Component/component.stepModel.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Text("Request",
                style: TextStyle(
                    fontSize: 14.sp, fontWeight: medium, color: Colors.white))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stepModelWidget(true),
              SizedBox(
                width: 3.w,
              ),
              stepModelWidget(false),
              SizedBox(
                width: 3.w,
              ),
              stepModelWidget(false),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
              child: Container(
            height: 100.h,
            width: 100.w,
            decoration: decorationContainerModel,
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    GetBuilder<RegisterController>(
                        init: controller,
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              controller.picPicture();
                            },
                            child: Container(
                              width: 70.sp,
                              height: 70.sp,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: greyColor),
                              child: controller.imageFromLocal
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(3000.sp),
                                      child: Image.file(
                                        controller.imageFile,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : null,
                            ),
                          );
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Profile image",
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                )),
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
                              "First name",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Person',
                              isString: true,
                              hintText: 'your first name',
                              textEditingController:
                                  controller.firstNameController,
                              validate: controller.validatePhoneNumber,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Last name",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Person',
                              isString: true,
                              hintText: 'your last name',
                              textEditingController:
                                  controller.lastNameController,
                              validate: controller.validatePhoneNumber,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Email',
                              isString: true,
                              hintText: 'your email',
                              textEditingController:
                                  controller.lastNameController,
                              validate: controller.validatePhoneNumber,
                              isPassword: false,
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Column(
                  children: [
                    buttonModel("Continue", () {
                      Get.to(() => const CarWidget());
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
