import 'package:currencyconverterapp/domain/entity/country_entity.dart';

class CurrencyHistoricalEntity {
  String? formCurrency;
  String? toCurrency;
  num? currencyValue;
  String? date;

  CurrencyHistoricalEntity(
      {this.currencyValue, this.formCurrency, this.toCurrency, this.date});
}
