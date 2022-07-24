import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:rodeo/Data/font.data.dart';
import 'package:flutter/services.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:rodeo/Data/translation.data.dart';
import 'package:rodeo/Views/Authentification/widget.welcomePage.dart';
import 'package:rodeo/Views/Trip/widget.search.dart';


import 'package:rodeo/Views/Trip/widget.trip.dart';
import 'package:sizer/sizer.dart';


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
        translations: LocalString(),
        locale:  const Locale('en', 'EN'),
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
