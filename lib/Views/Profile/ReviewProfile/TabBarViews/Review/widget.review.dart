import 'package:flutter/material.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Views/Component/component.circlePic.dart';
import 'package:rodeo/Views/Profile/ReviewProfile/TabBarViews/Review/component/component.reviewModel.dart';
import 'package:sizer/sizer.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      itemCount: 2,
      itemBuilder: (context, index) => reviewModel(),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 2.h,
        );
      },
    );
  }
}
