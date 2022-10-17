import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';

abstract class CurrencyConverterRepository {
  Future<List<CountryEntity>> getCountriesList();

  Future<List<CurrencyHistoricalEntity>> currencyHistoricalList(
      {String? startDate,
      String? endDate,
      String? toCurrency,
      String? fromCurrency});

  Future<CurrencyConvertEntity> convertCurrency(
      {String? formCurrencyId, String? toCurrencyId});
}
