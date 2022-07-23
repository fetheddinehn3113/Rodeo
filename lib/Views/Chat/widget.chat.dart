import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rodeo/Controllers/Authentification/controller.chat.dart';
import 'package:rodeo/Data/palette.data.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../Component/component.back.dart';
import '../Component/component.circlePic.dart';
import '../Component/component.decorationContainer.dart';
import 'component/component.input.dart';
import 'component/component.msgModel.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(title: const Text("Aiden Braby"), leading: back()),
        body: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                  width: 100.w,
                  decoration: decorationContainerModel,
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                            padding: EdgeInsets.only(
                                bottom: 2.h, left: 3.w, right: 7.w, top: 3.h),
                            itemCount: controller.messages.length,
                            itemBuilder: (context, index) => msgModel(
                                controller.messages[index].sender,
                                controller.messages[index].msg),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 2.h,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 6.w),
                        child: Row(
                          children: [
                            input(),
                            SizedBox(
                              width: 3.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.sendMsg();
                              },
                              child: SvgPicture.asset(
                                "assets/icons/Send.svg",
                                height: 20.sp,
                                width: 20.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
