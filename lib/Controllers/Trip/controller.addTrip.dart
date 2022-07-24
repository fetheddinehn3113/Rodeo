import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rodeo/Data/const.data.dart';
import 'package:rodeo/Views/Trip/widget.search.dart';
import 'package:rodeo/Views/Trip/widget.map.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as webService;
import 'package:google_api_headers/google_api_headers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Data/palette.data.dart';

class AddTripController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var switchDriverBool = false.obs;
  int dateSelected = 0;
  int onlyCustomSelected = 1; // 0 for only , 1 for custom
  var firstTime = TimeOfDay.now();
  var secondTime = TimeOfDay.now();
  var favoriteTime = TimeOfDay.now();

  Map<String, bool> daysSelected = {
    "Sa": false,
    "Mo": false,
    "Tu": false,
    "We": false,
    "Th": false,
    "Fr": false,
    "Su": false
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
        daysSelected[day] = weekDays[today.weekday - 1] == day;
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

  selectFirstPositionFromMap() {
    positionWorkingOnIt = "first";
    Get.to(() => const MapWidget());
  }

  selectSecondPositionFromMap() {
    positionWorkingOnIt = "second";
    Get.to(() => const MapWidget());
  }

  ///////// ////////////////////////// Map
  TextEditingController firstPositionController = TextEditingController();
  late LatLng firstPosition;

  late LatLng secondPosition;

  TextEditingController secondPositionController = TextEditingController();
  late GoogleMapController googleMapController;

  var requesting = false.obs;
  String positionWorkingOnIt = "first";
  final Set<Marker> markers = {};
  Location location = Location();
  LatLng localisationCamera = const LatLng(-1.7929665, -78.1368875);

  switchBool() {
    requesting.value = !requesting.value;
  }

  toSearch() {
    Get.to(() => SearchMapWidget());
  }

  //////// get localisation
  getLocalisation() async {
    bool failed = false;
    switchBool();
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    late LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        failed = true;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        failed = true;
      }
    }

    if (!failed) {
      if (firstPositionController.text.isNotEmpty &&
          positionWorkingOnIt == "first") {
        localisationCamera = firstPosition;
      } else if (secondPositionController.text.isNotEmpty &&
          positionWorkingOnIt == "second") {
        localisationCamera = secondPosition;
      } else {
        _locationData = await location.getLocation();
        localisationCamera =
            LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0);
      }
    }

    markers.add(
      Marker(
          markerId: const MarkerId('1'),
          position:
              LatLng(localisationCamera.latitude, localisationCamera.longitude),
          onTap: () {}),
    );
    getDetailAddress();
    switchBool();
  }

  //// when map is ready to use
  onMapCreated(mapController) {
    googleMapController = mapController;
  }

  //// when the camera move we update the marker position
  onCameraMove(position) {
    localisationCamera =
        LatLng(position.target.latitude, position.target.longitude);
    markers.clear();
    markers.add(Marker(
        zIndex: 10,
        rotation: 10,
        draggable: true,
        markerId: const MarkerId('1'),
        position: LatLng(position.target.latitude, position.target.longitude),
        onTap: () {}));
    update(["markers"]);
  }

  /////// get Detail of position ( country ....)
  getDetailAddress() async {
    var addresses = await geo.placemarkFromCoordinates(
        localisationCamera.latitude, localisationCamera.longitude);
    var address = addresses.first;
    searchController.text = address.country! +
        ", " +
        address.subAdministrativeArea! +
        "," +
        address.street!;
  }

  /////// go back to trip setttings
  backToSetting() {
    markers.clear();
    Get.back();
    if (positionWorkingOnIt == "first") {
      firstPositionController.text = searchController.text;
      firstPosition = localisationCamera;
    } else {
      secondPositionController.text = searchController.text;
      secondPosition = firstPosition = localisationCamera;
    }
  }

  ////////Search

  Future<void> displayPrediction(webService.Prediction p) async {
    webService.GoogleMapsPlaces places = webService.GoogleMapsPlaces(
        apiKey: apiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    webService.PlacesDetailsResponse detail =
        await places.getDetailsByPlaceId(p.placeId!);
    Get.back();
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}
