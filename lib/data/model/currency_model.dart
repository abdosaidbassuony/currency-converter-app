class CurrencyModel {
  String? currencyName;
  String? currencySymbol;
  String? id;

  CurrencyModel({
    this.currencyName,
    this.currencySymbol,
    this.id,
  });

  CurrencyModel.fromJson(dynamic json) {
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currencyName'] = currencyName;
    map['currencySymbol'] = currencySymbol;
    map['id'] = id;
    return map;
  }
}
