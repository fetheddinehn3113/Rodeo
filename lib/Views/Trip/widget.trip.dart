import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:rodeo/Data/font.data.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.back.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:rodeo/Views/Trip/Widgets/widget.pickDays.dart';
import 'package:rodeo/Views/Trip/component/component.ContainerTimeModel.dart';
import 'package:rodeo/Views/Trip/component/component.inputSwitch.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'Widgets/widget.pickTime.dart';
import 'component/component.inputReadOnly.dart';

class TripWidget extends StatefulWidget {
  const TripWidget({Key? key}) : super(key: key);

  @override
  _TripWidgetState createState() => _TripWidgetState();
}

class _TripWidgetState extends State<TripWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTripController());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Trip a planner"),
        leading: back(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
            width: double.infinity,
            decoration: decorationContainerModel,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Addresses",
                  style: TextStyle(fontSize: 11.sp, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                InputComponentTripReadOnly(
                  hintText: 'select position',
                  leadingIcon: 'Position',
                  onTap: controller.selectFromMap,
                  textEditingController: controller.firstPositionController,
                ),
                SizedBox(
                  height: 1.h,
                ),
                InputComponentTripReadOnly(
                  hintText: 'select position',
                  leadingIcon: 'Position',
                  onTap: controller.selectFromMap,
                  textEditingController: controller.firstPositionController,
                ),
                SizedBox(
                  height: 6.h,
                ),
                inputSwitch("Car", "Match me as a driver"),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Pick up time",
                  style: TextStyle(fontSize: 11.sp, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GetBuilder<AddTripController>(
                    init: controller,
                    builder: (context) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: containerTimeModel("Time",
                                    controller.formatTimeFromToFormat(), 0),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                flex: 4,
                                child: containerTimeModel("Heart",
                                    controller.favoriteTimeFormat(), 1),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              containerTimeModel("Date", "", 2),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GetBuilder<AddTripController>(
                              init: controller,
                              builder: (context) {
                                return controller.dateSelected == 2
                                    ? pickDay()
                                    : pickTime();
                              })
                        ],
                      );
                    })
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
