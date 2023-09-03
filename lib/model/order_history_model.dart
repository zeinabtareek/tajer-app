
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
    accountBalance = json['account_balance']??0;
    requiredMony = json['required_mony']??0.0;
    payoffs = json['payoffs']??0;
    companyPrecentage = json['company_precentage']??0;
    earnings = json['earnings']??0.0;
    companyShare = json['company_share']??0.0;
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
    date = json['date']??'';
    total = json['total']??0;
    companyShare = json['company_share']??0.0;
    companyPercentage = json['company_percentage']??0;
    earning = json['earning']??0;
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
