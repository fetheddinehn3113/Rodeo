import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rodeo/Controllers/Trip/controller.addTrip.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.button.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:rodeo/Views/Trip/component/component.searchInput.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final controller = Get.find<AddTripController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getLocalisation();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddTripController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(),
            body: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Obx(
                  () => Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: decorationContainerModel,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: controller.requesting.value
                              ? Center(
                                  child: SizedBox(
                                    height: 30.sp,
                                    width: 30.sp,
                                    child: const CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.sp),
                                      topLeft: Radius.circular(16.sp)),
                                  child: GetBuilder<AddTripController>(
                                    id: "markers",
                                    init: controller,
                                    builder: (context) {
                                      return GoogleMap(
                                        onMapCreated: controller.onMapCreated,
                                        onCameraMove: controller.onCameraMove,
                                        myLocationEnabled: true,
                                        myLocationButtonEnabled: true,
                                        markers: Set<Marker>.of(controller.markers),
                                        zoomControlsEnabled: true,
                                        onCameraIdle:controller.getDetailAddress,
                                        initialCameraPosition: CameraPosition(
                                          target: controller.localisationCamera,
                                          zoom: 9
                                        ),
                                      );
                                    }
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Set your position",
                                style: TextStyle(fontSize: 11.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InputComponentTrip(
                                textEditingController:
                                    controller.searchController,
                                hintText: 'Search for place'.tr,
                                leadingIcon: 'Search',
                                suffixICon: 'Target',
                                onTap: controller.toSearch,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Center(
                                child: buttonModel("Continue".tr, controller.backToSetting),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                )
              ],
            )));
  }
}
