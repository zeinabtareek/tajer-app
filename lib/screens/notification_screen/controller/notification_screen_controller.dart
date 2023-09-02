import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/model/notifications_model.dart';
import 'package:tajer/screens/notification_screen/services/notification_services.dart';

class NotificationScreenController extends BaseController {
  final service = NotificationServices();
  NotificationsModel? notifications;
  DateTime currentDateTime = DateTime.now();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setState(ViewState.busy);
    notifications = await service.getNotification();
    setState(ViewState.idle);
  }
  String getTimeDifference(DateTime currentDateTime, String dateStr) {
    try {
      DateTime otherDateTime = DateTime.parse(dateStr);
      Duration difference = currentDateTime.difference(otherDateTime);

      if (difference.inDays > 0) {
        return 'منذ ${difference.inDays} يوم';
      } else if (difference.inHours > 0) {
        return 'منذ ساعة';
      } else if (difference.inMinutes > 0) {
        return 'منذ ${difference.inMinutes} دقيقة';
      } else if (difference.inSeconds > 0) {
        return 'منذ ${difference.inSeconds} ثانية';
      } else {
        return 'الآن';
      }
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }
}
