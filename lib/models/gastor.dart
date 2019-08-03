class Gastor {
  String id;
  var ammount;
  String currency;

  Gastor({
    this.id,
    this.ammount,
    this.currency,
  });

  factory Gastor.fromJson(String key, json) {
    return Gastor(
      id: key,
      ammount: json['ammount'],
      currency: json['currency'],
    );
  }
}
