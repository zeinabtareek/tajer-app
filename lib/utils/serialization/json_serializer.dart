part of serialization;

class JsonSerializer {
  AbsLogger? _logger;

  JsonSerializer({AbsLogger? logger}) {
    _logger = logger; // ?? FakeLogger();
  }

  String serializeObject(Serializable obj) {
    return obj.serialize();
  }

  String serializeList<T extends Serializable>(List<T> list) {
    var buffer = StringBuffer();
    buffer.write("[");

    for (int i = 0; i < list.length; i++) {
      if (i != 0) buffer.write(",");
      buffer.write(list[i].serialize());
    }

    buffer.write("]");
    return buffer.toString();
  }

  String serializeValue(var value) {
    return json.encode(value);
  }

  //deserialization

  T deserializeObject<T extends Serializable>(String text, T empty) {
    try {
      _logger?.verbose("decoding the text $text");
      Map<String, dynamic> map = json.decode(text) as Map<String, dynamic>;

      _logger?.verbose("filling the object from the map $map");
      return empty..fromMap(map);
    } catch (e, s) {
      _logger?.error(
          error:
              "error while trying to deserialize the string '$text' to the type of '$empty'",
          stackTrace: s);
      rethrow;
    }
  }

  List<T> deserializeList<T extends Serializable>(
      String text, T Function() createItem) {
    try {
      _logger?.verbose("decoding the text $text");
      List<dynamic> mapList = json.decode(text);

      List<T> list = [];

      _logger?.verbose("filling the list from the mapList $mapList");

      for (int i = 0; i < mapList.length; i++) {
        var item = createItem()..fromMap(mapList[i] as Map<String, dynamic>);
        list.add(item);
      }
      return list;
    } catch (e) {
      _logger?.error(
          error:
              "error while trying to deserialize the string '$text' to List ");
      rethrow;
    }
  }

  ///for primitive data types only
  T deserializeValue<T>(String text) {
    try {
      return json.decode(text) as T;
    } catch (e, s) {
      _logger?.error(
          error: "error trying to parse the text $text and casting to type $T",
          stackTrace: s);
      rethrow;
    }
  }

  ///used if no ModelClass created for the data
  Map<String, dynamic> deserializeToMap(String text) {
    try {
      return json.decode(text) as Map<String, dynamic>;
    } catch (e, s) {
      _logger?.error(
          error: "error trying to parse the text $text and casting to map",
          stackTrace: s);
      rethrow;
    }
  }

  ///itemCreator is needed only with objects and lists, and not
  ///with primitive data types (int, double,.. )
  Object? deserialize(String? text, [Serializable Function()? itemCreator]) {
    if (text == null) return null;
    //
    if (text.startsWith("[")) {
      //that's a list
      return deserializeList(text, itemCreator!);
    } else if (text.startsWith("{")) {
      //that's an object
      return deserializeObject(text, itemCreator!());
    } else {
      return deserializeValue(text);
    }
  }

  ///itemCreator is needed only with objects and lists, and not
  ///with primitive data types (int, double,.. )
  //List<T> deserializeList<T>(dynamic list, T fromJsonMap(dynamic)) {
  //if (list == null) return null;
  //
  //  return (json.decode(list) as List).map<T>(fromJsonMap).toList();
  //}

  ///obj must be either :
  ///
  ///* a Serializale
  ///* a List<Serializable>
  ///* or a primitive data type (int, double,.. )
  String serialize(Object obj) {
    if (obj is List<Serializable>) {
      return serializeList(obj);
    } else if (obj is Serializable) {
      return serializeObject(obj);
    } else {
      return serializeValue(obj);
    }
  }
}
