part of serialization;
//import 'dart:convert';

abstract class Serializable {
  String serialize() {
    return json.encode(toMap());
  }

  void deserialize(String text) {
    fromMap(json.decode(text));
  }

  //abstract
  Map<String, dynamic> toMap();

  //abstract
  ///fills the instance fields from the map, and returns itself
  void fromMap(Map<String, dynamic> map);
}
