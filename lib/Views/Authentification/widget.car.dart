import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodeo/Views/BottomBar/widget.bottomBar.dart';
import 'package:sizer/sizer.dart';

import '../../Controllers/Authentification/controller.car.dart';
import '../../Data/font.data.dart';
import '../../Data/palette.data.dart';
import '../Component/component.button.dart';
import '../Component/component.decorationContainer.dart';
import 'Component/component.input.dart';
import 'Component/component.stepModel.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({Key? key}) : super(key: key);

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarController());
    return SafeArea(
        child: Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading : false ,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Text("Car".tr,
                style: TextStyle(
                    fontSize: 14.sp, fontWeight: medium, color: Colors.white))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 1.5.h,
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
            height: 2.5.h,
          ),
          Expanded(
              child: Container(
            height: 100.h,
            width: 100.w,
            decoration: decorationContainerModel,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Type of car".tr,
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Car',
                              isString: true,
                              hintText: 'Select your type of car'.tr,
                              textEditingController:
                                  controller.carTypeController,
                              validate: controller.validateCarType,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Registration number".tr,
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Registration',
                              isString: false,
                              hintText: 'Registration number'.tr,
                              textEditingController:
                                  controller.registrationNumberController,
                              validate: controller.validateRegistrationNumber,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Year".tr,
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            InputComponentAuthentification(
                              leadingIcon: 'Date',
                              isString: false,
                              hintText: 'Year of car'.tr,
                              textEditingController:
                                  controller.yearCarController,
                              validate: controller.validateYearCar,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Color".tr,
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 18.sp,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.colors.length,
                                itemBuilder: (context, index) => Container(
                                  height: 18.sp,
                                  width: 18.sp,
                                  decoration: const BoxDecoration(
                                      color: greyColor, shape: BoxShape.circle),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                  width: 2.w,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Column(
                  children: [
                    buttonModel("Continue".tr, () {
                       Get.offAll(()=>BottomBarWidget());
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
