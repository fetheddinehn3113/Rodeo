import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.back.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:sizer/sizer.dart';

import '../../../Data/font.data.dart';
import '../../Component/component.circlePic.dart';
import 'TabBarViews/Review/widget.review.dart';

class ReviewProfileWidget extends StatefulWidget {
  const ReviewProfileWidget({Key? key}) : super(key: key);

  @override
  _ReviewProfileWidgetState createState() => _ReviewProfileWidgetState();
}

class _ReviewProfileWidgetState extends State<ReviewProfileWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: back(),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Stack(
              children: [
                circlePicModel(75.sp,
                  pic,primaryColor),
                Positioned(
                    bottom: 1.h,
                    right: 2.w,
                    child: SvgPicture.asset(
                      "assets/icons/Valid.svg",
                      height: 12.sp,
                      width: 12.sp,
                    ))
              ],
            ),
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
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            decoration: decorationContainerModel,
            child: Column(
              children: [
                TabBar(

                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    indicatorWeight: 0.5.h,
                    labelStyle: TextStyle(
                        fontSize: 12.sp, fontWeight: medium),
                    unselectedLabelStyle:TextStyle(
                        fontSize: 12.sp, fontWeight: medium),
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Review'),
                      Tab(text: 'Carpoling'),
                    ]),
                Expanded(
                    child: TabBarView(
                      controller: tabController,
                  children: [Container(),const ReviewWidget(),Container()],
                ))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
