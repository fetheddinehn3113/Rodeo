import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rodeo/Data/font.data.dart';
import 'package:flutter/services.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Views/Authentification/widget.userType.dart';
import 'package:rodeo/Views/Trip/Widgets/widget.map.dart';
import 'package:rodeo/Views/Trip/widget.trip.dart';
import 'package:sizer/sizer.dart';
import 'Views/Authentification/widget.car.dart';
import 'Views/Authentification/widget.companyType.dart';
import 'Views/Authentification/widget.logIn.dart';
import 'Views/Authentification/widget.register.dart';
import 'Views/Authentification/widget.welcomePage.dart';
import 'Views/BottomBar/widget.bottomBar.dart';
import 'Views/Chat/widget.chat.dart';
import 'Views/Home/widget.home.dart';
import 'Views/Profile/ReviewProfile/widget.reviewProfile.dart';
import 'Views/guestList/widget.gestList.dart';

/*void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: primaryColor));
  runApp(DevicePreview(builder: (context) {
    return const MyApp();
  }));
}*/

void main() {
  //SdkContext.init(IsolateOrigin.main);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: primaryColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: primaryColor,
                centerTitle: true,
                titleTextStyle: TextStyle(fontSize: 14.sp, fontWeight: medium)),
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
            backgroundColor: primaryColor),
        debugShowCheckedModeBanner: false,
        home: const WelcomePageWidget(),
      );
    });
  }
}
