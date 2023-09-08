// import 'package:tajer/model/order_model.dart';
//
// class HomeModel {
//   HomeModel({
//       this.accountBalance,
//       this.ordersChart,
//       this.recentOrders,});
//
//   HomeModel.fromJson(dynamic json) {
//     accountBalance = json['account_balance'];
//     ordersChart = json['orders_chart'] != null ? OrdersChart.fromJson(json['orders_chart']) : null;
//     if (json['recent_orders'] != null) {
//       recentOrders = [];
//       json['recent_orders'].forEach((v) {
//         recentOrders?.add(Orders.fromJson(v));
//       });
//     }
//   }
//   double? accountBalance;
//   OrdersChart? ordersChart;
//   List<Orders>? recentOrders;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['account_balance'] = accountBalance;
//     if (ordersChart != null) {
//       map['orders_chart'] = ordersChart?.toJson();
//     }
//     if (recentOrders != null) {
//       map['recent_orders'] = recentOrders?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class RecentOrders {
//   RecentOrders({
//       this.id,
//       this.clientName,
//       this.clientImage,
//       this.orderNumber,
//       this.total,
//       this.totalBefore,
//       this.invoicesCount,});
//
//   RecentOrders.fromJson(dynamic json) {
//     id = json['id'];
//     clientName = json['client_name'];
//     clientImage = json['client_image'];
//     orderNumber = json['order_number'];
//     total = json['total'];
//     totalBefore = json['total_before'];
//     invoicesCount = json['invoices_count'];
//   }
//   double? id;
//   String? clientName;
//   dynamic clientImage;
//   double? orderNumber;
//   double? total;
//   double? totalBefore;
//   double? invoicesCount;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['client_name'] = clientName;
//     map['client_image'] = clientImage;
//     map['order_number'] = orderNumber;
//     map['total'] = total;
//     map['total_before'] = totalBefore;
//     map['invoices_count'] = invoicesCount;
//     return map;
//   }
//
// }
//
// class OrdersChart {
//   OrdersChart({
//       this.sunday,
//       this.monday,
//       this.tuesday,
//       this.wednesday,
//       this.thursday,
//       this.friday,
//       this.saturday,
//       this.min,
//       this.max,});
//
//   OrdersChart.fromJson(dynamic json) {
//     sunday = json['Sunday'] != null ? Sunday.fromJson(json['Sunday']) : null;
//     monday = json['Monday'] != null ? Monday.fromJson(json['Monday']) : null;
//     tuesday = json['Tuesday'] != null ? Tuesday.fromJson(json['Tuesday']) : null;
//     wednesday = json['Wednesday'] != null ? Wednesday.fromJson(json['Wednesday']) : null;
//     thursday = json['Thursday'] != null ? Thursday.fromJson(json['Thursday']) : null;
//     friday = json['Friday'] != null ? Friday.fromJson(json['Friday']) : null;
//     saturday = json['Saturday'] != null ? Saturday.fromJson(json['Saturday']) : null;
//     min = json['min'];
//     max = json['max'];
//   }
//   Sunday? sunday;
//   Monday? monday;
//   Tuesday? tuesday;
//   Wednesday? wednesday;
//   Thursday? thursday;
//   Friday? friday;
//   Saturday? saturday;
//   int? min;
//   int? max;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (sunday != null) {
//       map['Sunday'] = sunday?.toJson();
//     }
//     if (monday != null) {
//       map['Monday'] = monday?.toJson();
//     }
//     if (tuesday != null) {
//       map['Tuesday'] = tuesday?.toJson();
//     }
//     if (wednesday != null) {
//       map['Wednesday'] = wednesday?.toJson();
//     }
//     if (thursday != null) {
//       map['Thursday'] = thursday?.toJson();
//     }
//     if (friday != null) {
//       map['Friday'] = friday?.toJson();
//     }
//     if (saturday != null) {
//       map['Saturday'] = saturday?.toJson();
//     }
//     map['min'] = min;
//     map['max'] = max;
//     return map;
//   }
//
// }
//
// class Saturday {
//   Saturday({
//       this.companyShare,
//       this.total,});
//
//   Saturday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Friday {
//   Friday({
//       this.companyShare,
//       this.total,});
//
//   Friday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   double? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Thursday {
//   Thursday({
//       this.companyShare,
//       this.total,});
//
//   Thursday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Wednesday {
//   Wednesday({
//       this.companyShare,
//       this.total,});
//
//   Wednesday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Tuesday {
//   Tuesday({
//       this.companyShare,
//       this.total,});
//
//   Tuesday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Monday {
//   Monday({
//       this.companyShare,
//       this.total,});
//
//   Monday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }
//
// class Sunday {
//   Sunday({
//       this.companyShare,
//       this.total,});
//
//   Sunday.fromJson(dynamic json) {
//     companyShare = json['company_share'];
//     total = json['total'];
//   }
//   int? companyShare;
//   int? total;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['company_share'] = companyShare;
//     map['total'] = total;
//     return map;
//   }
//
// }


class HomeModel {
    double? accountBalance;
    OrdersChart? ordersChart;
    List<RecentOrders>? recentOrders;

    HomeModel({this.accountBalance, this.ordersChart, this.recentOrders});

    factory HomeModel.fromJson(Map<String, dynamic> json) {
        return HomeModel(
            accountBalance: json['account_balance']?.toDouble(),
            ordersChart: json['orders_chart'] != null ? OrdersChart.fromJson(json['orders_chart']) : null,
            recentOrders: json['recent_orders'] != null ? List<RecentOrders>.from(json['recent_orders'].map((x) => RecentOrders.fromJson(x))) : null,
        );
    }
}

class OrdersChart {
    Day? sunday;
    Day? monday;
    Day? tuesday;
    Day? wednesday;
    Day? thursday;
    Day? friday;
    Day? saturday;
    int? min;
    int? max;

    OrdersChart({this.sunday, this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.min, this.max});

    factory OrdersChart.fromJson(Map<String, dynamic> json) {
        return OrdersChart(
            sunday: json['Sunday'] != null ? Day.fromJson(json['Sunday']) : null,
            monday: json['Monday'] != null ? Day.fromJson(json['Monday']) : null,
            tuesday: json['Tuesday'] != null ? Day.fromJson(json['Tuesday']) : null,
            wednesday: json['Wednesday'] != null ? Day.fromJson(json['Wednesday']) : null,
            thursday: json['Thursday'] != null ? Day.fromJson(json['Thursday']) : null,
            friday: json['Friday'] != null ? Day.fromJson(json['Friday']) : null,
            saturday: json['Saturday'] != null ? Day.fromJson(json['Saturday']) : null,
            min: json['min'],
            max: json['max'],
        );
    }
}

class Day {
    dynamic companyShare;
    dynamic total;

    Day({this.companyShare, this.total});

    factory Day.fromJson(Map<String, dynamic> json) {
        return Day(
            companyShare: json['company_share'],
            total: json['total'],
        );
    }
}

class RecentOrders {
    int? id;
    String? clientName;
    String? clientImage;
    int? orderNumber;
    int? total;
    int? totalBefore;
    String? status;
    String? cancelationNote;
    int? invoicesCount;

    RecentOrders(
        {this.id,
            this.clientName,
            this.clientImage,
            this.orderNumber,
            this.total,
            this.totalBefore,
            this.status,
            this.cancelationNote,
            this.invoicesCount});

    RecentOrders.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        clientName = json['client_name']??'';
        clientImage = json['client_image']??'';
        orderNumber = json['order_number']??'';
        total = json['total']??'';
        totalBefore = json['total_before']??'';
        status = json['status']??'';
        cancelationNote = json['cancelation_note']??'';
        invoicesCount = json['invoices_count']??'';
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['client_name'] = this.clientName;
        data['client_image'] = this.clientImage;
        data['order_number'] = this.orderNumber;
        data['total'] = this.total;
        data['total_before'] = this.totalBefore;
        data['status'] = this.status;
        data['cancelation_note'] = this.cancelationNote;
        data['invoices_count'] = this.invoicesCount;
        return data;
    }
}