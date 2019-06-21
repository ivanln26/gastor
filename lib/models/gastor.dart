class Gastor {
  var ammount;
  String currency;

  Gastor({
    this.ammount,
    this.currency,
  });

  factory Gastor.fromJson(json) {
    return Gastor(
      ammount: json['ammount'],
      currency: json['currency'],
    );
  }
}
