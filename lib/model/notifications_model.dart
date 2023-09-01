class NotificationsModel {
  NotificationsModel({
      this.data,});

  NotificationsModel.fromJson(dynamic json) {
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
      this.body, 
      this.type, 
      this.data, 
      this.image, 
      this.date,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    body = json['body'];
    type = json['type'];
    data = json['data'] != null ? Body.fromJson(json['data']) : null;
    image = json['image'];
    date = json['date'];
  }
  int? id;
  String? body;
  String? type;
  Body? data;
  dynamic image;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['body'] = body;
    map['type'] = type;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['image'] = image;
    map['date'] = date;
    return map;
  }

}

class Body {
  Body({
      this.orderId, 
      this.clientName, 
      this.orderNumber, 
      this.providerName,});

  Body.fromJson(dynamic json) {
    orderId = json['order_id'];
    clientName = json['client_name'];
    orderNumber = json['order_number'];
    providerName = json['provider_name'];
  }
  int? orderId;
  String? clientName;
  int? orderNumber;
  String? providerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['client_name'] = clientName;
    map['order_number'] = orderNumber;
    map['provider_name'] = providerName;
    return map;
  }

}