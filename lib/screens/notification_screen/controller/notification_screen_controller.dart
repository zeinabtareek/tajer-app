import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/model/notifications_model.dart';
import 'package:tajer/screens/notification_screen/services/notification_services.dart';

class NotificationScreenController extends BaseController {
  final service = NotificationServices();
  NotificationsModel? notifications;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setState(ViewState.busy);
    notifications = await service.getNotification();
    setState(ViewState.idle);
  }
}
