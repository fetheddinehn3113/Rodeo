import 'package:flutter/material.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:rodeo/Views/Profile/MyProfile/component/component.itemModel.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../Component/component.circlePic.dart';


class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: circlePicModel(75.sp,
              pic,primaryColor),
        ),
        Text(
          "Gavin Potter",
          style: TextStyle(
              fontSize: 13.sp, color: Colors.white, fontWeight: semiBold),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          "Gavin.Potter@gmail.com",
          style: TextStyle(
              fontSize: 10.sp, color: Colors.white, fontWeight: medium),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            width: double.infinity,
            decoration: decorationContainerModel,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Account".tr,
                    style: TextStyle(fontSize: 12.sp, fontWeight: semiBold),
                  ),
                  itemModel("Fetheddine Hannai", "Personal informations"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Settings".tr,
                    style: TextStyle(fontSize: 12.sp, fontWeight: semiBold),
                  ),
                  itemModel("Langage", ""),
                  itemModel("Help", ""),
                  itemModel("Log out", ""),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
