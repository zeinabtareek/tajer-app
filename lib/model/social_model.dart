
class SocialModel {
  List<SocialData>? data;

  SocialModel({this.data});

  SocialModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SocialData>[];
      json['data'].forEach((v) {
        data!.add(new SocialData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialData {
  int? id;
  String? name;
  String? url;
  String? icon;

  SocialData({this.id, this.name, this.url, this.icon});

  SocialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['icon'] = this.icon;
    return data;
  }
}
