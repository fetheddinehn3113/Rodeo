import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:get/get.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Component/component.back.dart';
import 'package:rodeo/Views/Component/component.decorationContainer.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';
import 'dart:async';
import '../../Controllers/Trip/controller.addTrip.dart';
import 'package:google_api_headers/google_api_headers.dart';

final searchScaffoldKey = GlobalKey<ScaffoldState>();

class SearchMapWidget extends PlacesAutocompleteWidget {
  SearchMapWidget({Key? key})
      : super(
          types: [],
          strictbounds: false,
          key: key,
          apiKey: apiKey,
          sessionToken: Uuid().generateV4(),
          language: "en",
          components: [Component(Component.country, "dz")],
        );

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends PlacesAutocompleteState {
  final controller = Get.put(AddTripController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            leading: back(),
            title: Text("Select your marker".tr),
          ),
          key: searchScaffoldKey,
          body: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: decorationContainerModel,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                    child: Column(
                      children: [
                        AppBarPlacesAutoCompleteTextField(
                          textDecoration: inputDec,
                        ),
                        Expanded(
                          child: PlacesAutocompleteResult(
                            onTap: controller.displayPrediction,
                            logo: const SizedBox(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}

var inputDec = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 0.0),
  suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SvgPicture.asset(
        "assets/icons/Search.svg",
        color: primaryColor,
        height: 10.sp,
        width: 10.sp,
      ),
    ),
  ]),
  prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SvgPicture.asset(
        "assets/icons/Target.svg",
        color: primaryColor,
        height: 10.sp,
        width: 10.sp,
      ),
    ),
  ]),
  prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
  suffixIconConstraints: BoxConstraints(
    maxHeight: 12.sp,
    maxWidth: 50.w,
  ),
  filled: true,
  fillColor: const Color(0xffF6F6F6),
  hintText: "type a place".tr,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.sp),
      borderSide: BorderSide(color: primaryColor, width: 1.sp)),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(8.sp),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(8.sp),
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.sp),
      borderSide: BorderSide(color: const Color(0xffBDBDBD), width: 0.5.sp)),
);
