
class UserModel {
  String? message;
  Data? data;

  UserModel({this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Provider? provider;
  String? token;

  Data({this.provider, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Provider {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? companyName;
  String? password;
  String? address;
  String? currency;
  String? government;
  double? latitude;
  double? longitude;
  String? logo;
  String? bgImage;
  int? accountLimit;
  int? deliveryArea;
  bool? isActive;

  Provider(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.companyName,
        this.password,
        this.address,
        this.government,
        this.currency,
        this.latitude,
        this.longitude,
        this.logo,
        this.bgImage,
        this.accountLimit,
        this.deliveryArea,
        this.isActive});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    companyName = json['company_name'];
    password = json['password'];
    address = json['address'];
    government = json['government'];
    currency = json['currency'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    logo = json['logo'];
    bgImage = json['bg_image'];
    accountLimit = json['account_limit'];
    deliveryArea = json['delivery_area'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['company_name'] = this.companyName;
    data['currency'] = this.currency;
    data['password'] = this.password;
    data['address'] = this.address;
    data['government'] = this.government;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['logo'] = this.logo;
    data['bg_image'] = this.bgImage;
    data['account_limit'] = this.accountLimit;
    data['delivery_area'] = this.deliveryArea;
    data['is_active'] = this.isActive;
    return data;
  }
}
