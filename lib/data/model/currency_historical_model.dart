import 'package:currencyconverterapp/data/datasource/local/dummydata/countries_list.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';

class CurrencyHistoricalModel {
  num? currencyValue;
  String? formCountryId;
  String? toCountryId;

  CurrencyHistoricalModel(
      {this.currencyValue, this.formCountryId, this.toCountryId});
}
