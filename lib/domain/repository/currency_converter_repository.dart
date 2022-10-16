import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';

abstract class CurrencyConverterRepository {
  Future<List<CountryEntity>> getCountriesList();

  Future<List<CurrencyHistoricalEntity>> currencyHistoricalList();

  Future<CurrencyConvertEntity> convertCurrency(
      {String? formCurrencyId, String? toCurrencyId});
}
