import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/screens/support_screen/controller/support_screen_controller.dart';

import '../../constants/style.dart';
import '../../model/chat_model.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportScreenController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title: Text(
            'الدعم',
            style: K.boldBlackText,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/logo.jpeg',
                fit: BoxFit.contain,
                width: 70,
                height: 70,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ))
          ],

          // )
        ),
        body: Obx(() => controller.state == ViewState.busy
        // body: Obx(() => controller.isLoading.value
            ?   Center(
                child: CupertinoActivityIndicator(
                  color: K.primaryColor,
                ),
              )
            : Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.messageModel!.data!.length,
                        shrinkWrap: true,
                        controller: controller.scrollController,
                        reverse: false,

                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: controller.messageModel!
                                          .data![index].senderType ==
                                      "user"
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                controller.messageModel!.data![index]
                                            .senderType ==
                                        "user"
                                    ? ClipOval(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          'assets/images/logo.jpeg',
                                          fit: BoxFit.contain,
                                          width: 30,
                                          height: 30,
                                        ),
                                      )
                                    : const SizedBox(),
                                K.sizedboxW,
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(controller
                                                    .messageModel!
                                                    .data![index]
                                                    .senderType ==
                                                "user"
                                            ? 0
                                            : 20),
                                        topRight: const Radius.circular(20),
                                        bottomRight: Radius.circular(controller
                                                    .messageModel!
                                                    .data![index]
                                                    .senderType ==
                                                "user"
                                            ? 20
                                            : 0),
                                        topLeft: const Radius.circular(20),
                                      ),
                                      color: (controller.messageModel!
                                                  .data![index].senderType ==
                                              "user"
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade400),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      controller.messageModel!.data![index]
                                              .message ??
                                          "",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                K.sizedboxW,
                                controller.messageModel!.data![index]
                                            .senderType !=
                                        "user"
                                    ? ClipOval(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          'assets/images/logo.jpeg',
                                          fit: BoxFit.contain,
                                          width: 30,
                                          height: 30,
                                        ),
                                      )
                                    : const SizedBox(),
                                K.sizedboxW,
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[100],
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.all(30),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.sendMessage();
                                controller.onInit();
                              },
                              child: Image.asset(
                                'assets/images/send.png',
                                width: 25.w,
                                height: 40.h,
                              ),
                            ),
                            K.sizedboxW,
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  controller.message.value = value;
                                },
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'اكتب هنا رسالتك',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // K.sizedboxH,
                    K.sizedboxH,
                    K.sizedboxH,
                  ],
                ),
              )));
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(
      messageContent: "How have you been?How have you been?How have you been?",
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Hey Kriss, I am doing fine dude. wbu?Hey Kriss, I am doing fine dude. wbu?Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
