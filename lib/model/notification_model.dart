class NotificationModel {
  String? title;
  String? message;


  NotificationModel({this.title, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];

  }

}