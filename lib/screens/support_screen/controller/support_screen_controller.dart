import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/model/message_model.dart';
import 'package:tajer/screens/support_screen/services/support_services.dart';

class SupportScreenController extends BaseController {
  final services = SupportServices();
  final message = "".obs;
  final isLoading = false.obs;
  MessageModel? messageModel;
  ScrollController scrollController = ScrollController();

  @override
  onInit() async {
    super.onInit();

    setState(ViewState.busy);
    isLoading.value=true;
    messageModel = await services.getMessage();
    isLoading.value=false;
    setState(ViewState.idle);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  sendMessage() async {

    await services.sendMessage(message: message.value);


  }
}
