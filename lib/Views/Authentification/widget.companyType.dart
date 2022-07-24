import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodeo/Views/Authentification/widget.register.dart';

import 'package:sizer/sizer.dart';

import '../../Controllers/Authentification/controller.companyType.dart';
import '../../Data/font.data.dart';
import '../../Data/palette.data.dart';
import '../Component/component.button.dart';
import '../Component/component.decorationContainer.dart';
import 'Component/component.typeModel.dart';

class CompanyTypeWidget extends StatefulWidget {
  const CompanyTypeWidget({Key? key}) : super(key: key);

  @override
  _CompanyTypeWidgetState createState() => _CompanyTypeWidgetState();
}

class _CompanyTypeWidgetState extends State<CompanyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompanyTypeController());
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.h),
                child: Text("Login".tr,
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
                                  "Select your type",
                                  style:
                                  TextStyle(fontSize: 14.sp, fontWeight: semiBold),
                                ))),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder<CompanyTypeController>(
                                    init: controller,
                                    builder: (context) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Expanded(flex: 2, child: SizedBox()),
                                          InkWell(
                                            onTap: () {
                                              controller.changeType("Company");
                                            },
                                            child: typeModelWidget(
                                                controller.selected("Company"),
                                                "Company".tr),
                                          ),
                                          const Expanded(flex: 1, child: SizedBox()),
                                          InkWell(
                                            onTap: () {
                                              controller.changeType("Individual");
                                            },
                                            child: typeModelWidget(
                                                controller.selected("Individual"), "Individual".tr),
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
                                buttonModel("Continue".tr, () {
                                  Get.to(()=>RegisterWidget());
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
