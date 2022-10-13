import 'package:currencyconverterapp/domain/entity/country_entity.dart';

class CountryModel {
  String? countryId;
  String? countryName;
  String? countryCurrencyCode;
  String? countryImage;

  CountryModel(
      {this.countryId,
      this.countryCurrencyCode,
      this.countryImage,
      this.countryName});

  CountryEntity toCountryEntity() {
    return CountryEntity(
        countryCurrencyCode: countryCurrencyCode,
        countryId: countryId,
        countryImage: countryImage,
        countryName: countryName);
  }
}
