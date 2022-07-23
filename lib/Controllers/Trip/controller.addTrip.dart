import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Views/Trip/Widgets/widget.map.dart';
import 'package:location/location.dart';

class AddTripController extends GetxController {
  TextEditingController firstPositionController = TextEditingController();
  TextEditingController secondPositionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var switchDriverBool = false.obs;
  int dateSelected = 0;
  int onlyCustomSelected = 1; // 0 for only , 1 for custom
  var firstTime = TimeOfDay.now();
  var secondTime = TimeOfDay.now();
  var favoriteTime = TimeOfDay.now();

  @override
  void onInit(){
    super.onInit();
    getLocation();
  }

  Map<String, bool> daysSelected = {
    "Su": false,
    "Mo": false,
    "Tu": false,
    "We": false,
    "Th": false,
    "Fr": false,
    "Sa": false
  };

  switchDriver(bool value) {
    switchDriverBool.value = value;
  }

  ///////////////////////////////// UI choosing days ....

  updateDateSelected(int index) {
    dateSelected = index;
    update();
  }

  updateOnlyCustomSelected(int index) {
    onlyCustomSelected = index;
    if (index == 0) {
      var today = DateTime.now();
      daysSelected.forEach((day, value) {
        daysSelected[day] = weekDays[today.weekday] == day;
      });
    }
    update();
  }

  switchSelectedDay(String day) {
    if (onlyCustomSelected == 1) {
      daysSelected[day] = !(daysSelected[day] ?? false);
    }
    update();
  }

  bool isDateSelected(int index) {
    return index == dateSelected;
  }

  bool isOnlyCustomSelected(int index) {
    return index == onlyCustomSelected;
  }

  bool isDaySelected(String day) {
    return daysSelected[day] ?? false;
  }

  ///////////////////////////////// UI pick time .. hours .. time ....

  // index = 0 pour first , 1 pour second , 2 for favory
  pickTime(int index) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: firstTime,
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');
    if (pickedTime != null) {
      if (index == 0) {
        firstTime = pickedTime;
      } else if (index == 1) {
        secondTime = pickedTime;
      } else {
        favoriteTime = pickedTime;
      }
    }
    update();
  }

  String firstTimeFormat() {
    return firstTime.hour.toString().padLeft(2, "0") +
        ":" +
        firstTime.minute.toString().padLeft(2, "0");
  }

  String secondTimeFormat() {
    return secondTime.hour.toString().padLeft(2, "0") +
        ":" +
        secondTime.minute.toString().padLeft(2, "0");
  }

  String favoriteTimeFormat() {
    return favoriteTime.hour.toString().padLeft(2, "0") +
        ":" +
        favoriteTime.minute.toString().padLeft(2, "0");
  }

  String formatTimeFromToFormat() {
    return firstTimeFormat() + "-" + secondTimeFormat();
  }



  ///////// Map
  var requesting = false.obs;

  switchBool(){
    requesting.value = !requesting.value;
  }

  selectFromMap() {
    Get.to(() => const MapWidget());
  }
  Location location = Location();
  late LatLng initialLocalisation ;

  getLocation() async {
    switchBool();
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    late LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    initialLocalisation = LatLng(_locationData.latitude ?? 0, _locationData.longitude ??0);

    switchBool();
  }
}
