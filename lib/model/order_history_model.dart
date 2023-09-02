
class OrderHistoryModel {
  FinancialReport? financialReport;
  List<Items>? items;

  OrderHistoryModel({this.financialReport, this.items});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    financialReport = json['financialReport'] != null
        ? new FinancialReport.fromJson(json['financialReport'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.financialReport != null) {
      data['financialReport'] = this.financialReport!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinancialReport {
  int? accountBalance;
  double? requiredMony;
  int? payoffs;
  int? companyPrecentage;
  double? earnings;
  double? companyShare;

  FinancialReport(
      {this.accountBalance,
        this.requiredMony,
        this.payoffs,
        this.companyPrecentage,
        this.earnings,
        this.companyShare});

  FinancialReport.fromJson(Map<String, dynamic> json) {
    accountBalance = json['account_balance'];
    requiredMony = json['required_mony'];
    payoffs = json['payoffs'];
    companyPrecentage = json['company_precentage'];
    earnings = json['earnings'];
    companyShare = json['company_share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_balance'] = this.accountBalance;
    data['required_mony'] = this.requiredMony;
    data['payoffs'] = this.payoffs;
    data['company_precentage'] = this.companyPrecentage;
    data['earnings'] = this.earnings;
    data['company_share'] = this.companyShare;
    return data;
  }
}

class Items {
  String? date;
  int? total;
  double? companyShare;
  int? companyPercentage;
  double? earning;

  Items(
      {this.date,
        this.total,
        this.companyShare,
        this.companyPercentage,
        this.earning});

  Items.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    total = json['total'];
    companyShare = json['company_share'];
    companyPercentage = json['company_percentage'];
    earning = json['earning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['total'] = this.total;
    data['company_share'] = this.companyShare;
    data['company_percentage'] = this.companyPercentage;
    data['earning'] = this.earning;
    return data;
  }
}
