import 'package:currencyconverterapp/domain/entity/country_entity.dart';

class CurrencyHistoricalEntity {
  CountryEntity? formCurrency;
  CountryEntity? toCurrency;
  double? currencyValue;

  CurrencyHistoricalEntity(
      {this.currencyValue, this.formCurrency, this.toCurrency});
}
