//
// class ReportModel {
//   double ?total;
//   double ?companyShare;
//   OrdersChart? ordersChart;
//   List<dynamic>? grouped;
//
//   ReportModel({
//     this.total,
//     this.companyShare,
//     this.ordersChart,
//     this.grouped,
//   });
//
//   ReportModel.fromJson(Map<String, dynamic> json)
//       : total = json['total'].toDouble(),
//         companyShare = json['company_share'].toDouble(),
//         ordersChart = OrdersChart.fromJson(json['orders_chart']),
//         grouped = List<dynamic>.from(json['grouped']);
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['total'] = total;
//     data['company_share'] = companyShare;
//     data['orders_chart'] = ordersChart!.toJson();
//     data['grouped'] = grouped;
//     return data;
//   }
// }
//
// class OrdersChart {
//   Sunday sunday;
//   Sunday monday;
//   Sunday tuesday;
//   Sunday wednesday;
//   Sunday thursday;
//   Sunday friday;
//   Sunday saturday;
//   int min;
//   int max;
//
//   OrdersChart({
//     required this.sunday,
//     required this.monday,
//     required this.tuesday,
//     required this.wednesday,
//     required this.thursday,
//     required this.friday,
//     required this.saturday,
//     required this.min,
//     required this.max,
//   });
//
//   OrdersChart.fromJson(Map<String, dynamic> json)
//       : sunday = Sunday.fromJson(json['Sunday']),
//         monday = Sunday.fromJson(json['Monday']),
//         tuesday = Sunday.fromJson(json['Tuesday']),
//         wednesday = Sunday.fromJson(json['Wednesday']),
//         thursday = Sunday.fromJson(json['Thursday']),
//         friday = Sunday.fromJson(json['Friday']),
//         saturday = Sunday.fromJson(json['Saturday']),
//         min = json['min'],
//         max = json['max'];
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['Sunday'] = sunday.toJson();
//     data['Monday'] = monday.toJson();
//     data['Tuesday'] = tuesday.toJson();
//     data['Wednesday'] = wednesday.toJson();
//     data['Thursday'] = thursday.toJson();
//     data['Friday'] = friday.toJson();
//     data['Saturday'] = saturday.toJson();
//     data['min'] = min;
//     data['max'] = max;
//     return data;
//   }
// }
//
// class Sunday {
//   double companyShare;
//   double total;
//
//   Sunday({
//     required this.companyShare,
//     required this.total,
//   });
//
//   Sunday.fromJson(Map<String, dynamic> json)
//       : companyShare = json['company_share'].toDouble(),
//         total = json['total'].toDouble();
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['company_share'] = companyShare;
//     data['total'] = total;
//     return data;
//   }
// }



class ReportModel {
  double? total;
  double? companyShare;
  OrdersChart? ordersChart;
  List<GroupedData>? grouped;

  ReportModel({
    this.total,
    this.companyShare,
    this.ordersChart,
    this.grouped,
  });

  ReportModel.fromJson(Map<String, dynamic> json)
      : total = json['total'].toDouble(),
        companyShare = json['company_share'].toDouble(),
        ordersChart = OrdersChart.fromJson(json['orders_chart']),
        grouped = List<GroupedData>.from(
            json['grouped'].map((x) => GroupedData.fromJson(x)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['company_share'] = companyShare;
    data['orders_chart'] = ordersChart!.toJson();
    data['grouped'] = grouped!.map((x) => x.toJson()).toList();
    return data;
  }
}

class OrdersChart {
  Sunday? sunday;
  Sunday? monday;
  Sunday? tuesday;
  Sunday? wednesday;
  Sunday? thursday;
  Sunday? friday;
  Sunday? saturday;
  int? min;
  int? max;

  OrdersChart({
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.min,
    this.max,
  });

  OrdersChart.fromJson(Map<String, dynamic> json)
      : sunday = Sunday.fromJson(json['Sunday']),
        monday = Sunday.fromJson(json['Monday']),
        tuesday = Sunday.fromJson(json['Tuesday']),
        wednesday = Sunday.fromJson(json['Wednesday']),
        thursday = Sunday.fromJson(json['Thursday']),
        friday = Sunday.fromJson(json['Friday']),
        saturday = Sunday.fromJson(json['Saturday']),
        min = json['min'],
        max = json['max'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Sunday'] = sunday!.toJson();
    data['Monday'] = monday!.toJson();
    data['Tuesday'] = tuesday!.toJson();
    data['Wednesday'] = wednesday!.toJson();
    data['Thursday'] = thursday!.toJson();
    data['Friday'] = friday!.toJson();
    data['Saturday'] = saturday!.toJson();
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

class Sunday {
  double? companyShare;
  double? total;

  Sunday({
    this.companyShare,
    this.total,
  });

  Sunday.fromJson(Map<String, dynamic> json)
      : companyShare = json['company_share'].toDouble(),
        total = json['total'].toDouble();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['company_share'] = companyShare;
    data['total'] = total;
    return data;
  }
}

class GroupedData {
  String? date;
  String? dayName;
  double? total;
  double? companyShare;

  GroupedData({
    this.date,
    this.dayName,
    this.total,
    this.companyShare,
  });

  GroupedData.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        dayName = json['day_name'],
        total = json['total'].toDouble(),
        companyShare = json['company_share'].toDouble();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['day_name'] = dayName;
    data['total'] = total;
    data['company_share'] = companyShare;
    return data;
  }
}