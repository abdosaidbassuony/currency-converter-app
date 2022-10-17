import 'package:currencyconverterapp/domain/entity/country_entity.dart';

class CountriesModel {
  CountriesModel({
    this.alpha3,
    this.currencyId,
    this.currencyName,
    this.currencySymbol,
    this.id,
    this.name,
  });

  CountriesModel.fromJson(dynamic json) {
    alpha3 = json['alpha3'];
    currencyId = json['currencyId'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    id = json['id'];
    name = json['name'];
  }

  String? alpha3;
  String? currencyId;
  String? currencyName;
  String? currencySymbol;
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alpha3'] = alpha3;
    map['currencyId'] = currencyId;
    map['currencyName'] = currencyName;
    map['currencySymbol'] = currencySymbol;
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  CountryEntity toCountryEntity() {
    return CountryEntity(
        countryId: id,
        currencyId: currencyId,
        currencyName: currencyName,
        currencySymbol: currencySymbol,
        countryImage: "assets/images/${id!.toLowerCase()}.png",
        countryName: name);
  }
}
