class OrderDetailsModel {
  OrderDetailsModel({
      this.data,});

  OrderDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.orderNumber, 
      this.total, 
      this.clientName, 
      this.clientImage, 
      this.clientLocation, 
      this.clientLatitude, 
      this.clientLongitude, 
      this.currency,
      this.date,
      this.status,
      this.invoices,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    orderNumber = json['order_number'];
    currency = json['currency'];
    status = json['status'];
    total = json['total'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
    clientLocation = json['client_location'];
    clientLatitude = json['client_latitude'];
    clientLongitude = json['client_longitude'];
    date = json['date'];
    if (json['invoices'] != null) {
      invoices = [];
      json['invoices'].forEach((v) {
        invoices?.add(Invoices.fromJson(v));
      });
    }
  }
  int? id;
  int? orderNumber;
  int? total;
  String? clientName;
  String? currency;
  dynamic clientImage;
  String? clientLocation;
  String? status;
  double? clientLatitude;
  double? clientLongitude;
  String? date;
  List<Invoices>? invoices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_number'] = orderNumber;
    map['total'] = total;
    map['currency'] = currency;
    map['status'] = status;
    map['client_name'] = clientName;
    map['client_image'] = clientImage;
    map['client_location'] = clientLocation;
    map['client_latitude'] = clientLatitude;
    map['client_longitude'] = clientLongitude;
    map['date'] = date;
    if (invoices != null) {
      map['invoices'] = invoices?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Invoices {
  Invoices({
      this.id, 
      this.name, 
      this.type, 
      this.priceBefore, 
      this.priceAfter, 
      this.total, 
      this.quantity, 
      this.images,});

  Invoices.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    priceBefore = json['price_before'];
    priceAfter = json['price_after'];
    total = json['total'];
    currency = json['currency'];
    quantity = json['quantity'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? type;
  String? currency;
  int? priceBefore;
  int? priceAfter;
  int? total;
  int? quantity;
  List<Images>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['currency'] = currency;
    map['price_before'] = priceBefore;
    map['price_after'] = priceAfter;
    map['total'] = total;
    map['quantity'] = quantity;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Images {
  Images({
      this.imageUrl,});

  Images.fromJson(dynamic json) {
    imageUrl = json['image_url'];
  }
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = imageUrl;
    return map;
  }

}