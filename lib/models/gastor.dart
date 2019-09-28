class Gastor {
  String id;
  var ammount;
  String currency;
  DateTime createdAt;

  Gastor({
    this.id,
    this.ammount,
    this.currency,
    this.createdAt,
  });

  factory Gastor.fromJson(String key, json) {
    return Gastor(
      id: key,
      ammount: json['ammount'],
      currency: json['currency'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
