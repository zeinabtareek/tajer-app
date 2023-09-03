class OrderModel {
  OrderModel({
      this.data,});

  OrderModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Orders {
  Orders({
      this.id, 
      this.clientName, 
      this.clientImage, 
      this.orderNumber, 
      this.total, 
      this.totalBefore,
    this.status,
    this.cancelationNote,

    this.invoicesCount,});

  Orders.fromJson(dynamic json) {
    id = json['id'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
    orderNumber = json['order_number'];
    total = json['total'];
    totalBefore = json['total_before'];
    invoicesCount = json['invoices_count'];

    status = json['status'];
    cancelationNote = json['cancelation_note'];
  }
  int? id;
  String? clientName;
  dynamic clientImage;
  int? orderNumber;
  int? total;
  int? totalBefore;
  int? invoicesCount;
  String? status;
  String? cancelationNote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_name'] = clientName;
    map['client_image'] = clientImage;
    map['order_number'] = orderNumber;
    map['total'] = total;
    map['total_before'] = totalBefore;
    map['invoices_count'] = invoicesCount;
    map['cancelation_note'] = cancelationNote;
    map['status'] = status;

    return map;
  }

}