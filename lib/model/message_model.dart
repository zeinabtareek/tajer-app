class MessageModel {
  MessageModel({
      this.data,});

  MessageModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.message, 
      this.senderType, 
      this.time, 
      this.admin,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    senderType = json['sender_type'];
    time = json['time'];
    admin = json['admin'];
  }
  int? id;
  String? message;
  String? senderType;
  String? time;
  dynamic admin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    map['sender_type'] = senderType;
    map['time'] = time;
    map['admin'] = admin;
    return map;
  }

}