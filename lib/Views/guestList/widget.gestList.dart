import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.back.dart';
import 'package:rodeo/Views/Component/component.circlePic.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:rodeo/Views/guestList/component/component.ItemGustList.dart';
import 'package:sizer/sizer.dart';

class GuestListWidget extends StatefulWidget {
  const GuestListWidget({Key? key}) : super(key: key);

  @override
  _GuestListWidgetState createState() => _GuestListWidgetState();
}

class _GuestListWidgetState extends State<GuestListWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
    children: [
      SizedBox(
        height: 2.h,
      ),
      Expanded(
        child: Container(
            decoration: decorationContainerModel,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              itemBuilder: (context, index) => itemGuestList(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 1.h,
                );
              },
              itemCount: 2,
            )),
      )
    ],
      );
  }
}
