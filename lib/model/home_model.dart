import 'package:tajer/model/order_model.dart';

class HomeModel {
  HomeModel({
      this.accountBalance, 
      this.ordersChart, 
      this.recentOrders,});

  HomeModel.fromJson(dynamic json) {
    accountBalance = json['account_balance'];
    ordersChart = json['orders_chart'] != null ? OrdersChart.fromJson(json['orders_chart']) : null;
    if (json['recent_orders'] != null) {
      recentOrders = [];
      json['recent_orders'].forEach((v) {
        recentOrders?.add(Orders.fromJson(v));
      });
    }
  }
  int? accountBalance;
  OrdersChart? ordersChart;
  List<Orders>? recentOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_balance'] = accountBalance;
    if (ordersChart != null) {
      map['orders_chart'] = ordersChart?.toJson();
    }
    if (recentOrders != null) {
      map['recent_orders'] = recentOrders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RecentOrders {
  RecentOrders({
      this.id, 
      this.clientName, 
      this.clientImage, 
      this.orderNumber, 
      this.total, 
      this.totalBefore, 
      this.invoicesCount,});

  RecentOrders.fromJson(dynamic json) {
    id = json['id'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
    orderNumber = json['order_number'];
    total = json['total'];
    totalBefore = json['total_before'];
    invoicesCount = json['invoices_count'];
  }
  int? id;
  String? clientName;
  dynamic clientImage;
  int? orderNumber;
  int? total;
  int? totalBefore;
  int? invoicesCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_name'] = clientName;
    map['client_image'] = clientImage;
    map['order_number'] = orderNumber;
    map['total'] = total;
    map['total_before'] = totalBefore;
    map['invoices_count'] = invoicesCount;
    return map;
  }

}

class OrdersChart {
  OrdersChart({
      this.sunday, 
      this.monday, 
      this.tuesday, 
      this.wednesday, 
      this.thursday, 
      this.friday, 
      this.saturday, 
      this.min, 
      this.max,});

  OrdersChart.fromJson(dynamic json) {
    sunday = json['Sunday'] != null ? Sunday.fromJson(json['Sunday']) : null;
    monday = json['Monday'] != null ? Monday.fromJson(json['Monday']) : null;
    tuesday = json['Tuesday'] != null ? Tuesday.fromJson(json['Tuesday']) : null;
    wednesday = json['Wednesday'] != null ? Wednesday.fromJson(json['Wednesday']) : null;
    thursday = json['Thursday'] != null ? Thursday.fromJson(json['Thursday']) : null;
    friday = json['Friday'] != null ? Friday.fromJson(json['Friday']) : null;
    saturday = json['Saturday'] != null ? Saturday.fromJson(json['Saturday']) : null;
    min = json['min'];
    max = json['max'];
  }
  Sunday? sunday;
  Monday? monday;
  Tuesday? tuesday;
  Wednesday? wednesday;
  Thursday? thursday;
  Friday? friday;
  Saturday? saturday;
  int? min;
  int? max;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sunday != null) {
      map['Sunday'] = sunday?.toJson();
    }
    if (monday != null) {
      map['Monday'] = monday?.toJson();
    }
    if (tuesday != null) {
      map['Tuesday'] = tuesday?.toJson();
    }
    if (wednesday != null) {
      map['Wednesday'] = wednesday?.toJson();
    }
    if (thursday != null) {
      map['Thursday'] = thursday?.toJson();
    }
    if (friday != null) {
      map['Friday'] = friday?.toJson();
    }
    if (saturday != null) {
      map['Saturday'] = saturday?.toJson();
    }
    map['min'] = min;
    map['max'] = max;
    return map;
  }

}

class Saturday {
  Saturday({
      this.companyShare, 
      this.total,});

  Saturday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Friday {
  Friday({
      this.companyShare, 
      this.total,});

  Friday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  double? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Thursday {
  Thursday({
      this.companyShare, 
      this.total,});

  Thursday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Wednesday {
  Wednesday({
      this.companyShare, 
      this.total,});

  Wednesday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Tuesday {
  Tuesday({
      this.companyShare, 
      this.total,});

  Tuesday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Monday {
  Monday({
      this.companyShare, 
      this.total,});

  Monday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}

class Sunday {
  Sunday({
      this.companyShare, 
      this.total,});

  Sunday.fromJson(dynamic json) {
    companyShare = json['company_share'];
    total = json['total'];
  }
  int? companyShare;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_share'] = companyShare;
    map['total'] = total;
    return map;
  }

}