import 'package:currencyconverterapp/data/datasource/local/dummydata/countries_list.dart';
import 'package:currencyconverterapp/data/datasource/local/dummydata/historical_data.dart';
import 'package:currencyconverterapp/data/datasource/remote/currency_converter_api_service/currency_converter_api_service.dart';
import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class CurrencyConverterRepositoryImpl extends CurrencyConverterRepository {
  final CurrencyConverterApiService _currencyConverterApiService;

  CurrencyConverterRepositoryImpl(this._currencyConverterApiService);

  @override
  Future<List<CurrencyHistoricalEntity>> currencyHistoricalList() async {
    List<CurrencyHistoricalEntity>? currencyHistoricalEntityList = [];
    for (var currencyHistoricalItem in currencyHistorical) {
      currencyHistoricalEntityList
          .add(currencyHistoricalItem.toCurrencyHistoricalEntity());
    }
    return currencyHistoricalEntityList;
  }

  @override
  Future<List<CountryEntity>> getCountriesList() async {
    List<CountryEntity>? currencyEntityList = [];
    for (var countryItem in countriesList) {
      currencyEntityList.add(countryItem.toCountryEntity());
    }
    return currencyEntityList;
  }

  @override
  Future<CurrencyConvertEntity> convertCurrency(
      {String? formCurrencyId, String? toCurrencyId}) async {
    CurrencyConvertEntity? convertEntity;
    try {
      var currencyConvertResponse = await _currencyConverterApiService
          .currencyConvertApi(fromToCurrency: "$formCurrencyId,$toCurrencyId");
      convertEntity = CurrencyConvertEntity(
          fromCurrency: currencyConvertResponse[formCurrencyId],
          toCurrency: currencyConvertResponse[toCurrencyId]);
    } catch (e) {
      print("error : $e");
    }
    return convertEntity!;
  }
}
