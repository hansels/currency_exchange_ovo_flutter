class Currency {
  String id;
  String name;
  double value;

  Currency({this.id, this.name, this.value});

  static Currency fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Currency(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            value: data["value"] ?? 0.0,
          );
  }

  static List<Currency> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
