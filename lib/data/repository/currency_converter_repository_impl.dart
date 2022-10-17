import 'package:currencyconverterapp/core/utils/extensions.dart';
import 'package:currencyconverterapp/data/datasource/local/dummydata/countries_list.dart';
import 'package:currencyconverterapp/data/datasource/local/dummydata/historical_data.dart';
import 'package:currencyconverterapp/data/datasource/remote/currency_converter_api_service/currency_converter_api_service.dart';
import 'package:currencyconverterapp/data/model/countries_model.dart';
import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';
import 'package:dio/dio.dart';

class CurrencyConverterRepositoryImpl extends CurrencyConverterRepository {
  final CurrencyConverterApiService _currencyConverterApiService;

  CurrencyConverterRepositoryImpl(this._currencyConverterApiService);

  @override
  Future<List<CurrencyHistoricalEntity>> currencyHistoricalList(
      {String? startDate,
      String? endDate,
      String? toCurrency,
      String? fromCurrency}) async {
    List<CurrencyHistoricalEntity>? currencyHistoricalEntityList = [];
    try {
      var response =
          await _currencyConverterApiService.getCurrencyHistoricalApi(
              endDate: endDate,
              startDate: startDate,
              fromToCurrency: "${fromCurrency}_$toCurrency");

      for (var responseItem in (response as Map).values) {
        (responseItem as Map).toList((entry) =>
            currencyHistoricalEntityList.add(CurrencyHistoricalEntity(
                currencyValue: entry.value,
                date: entry.key,
                formCurrency: fromCurrency,
                toCurrency: toCurrency)));
      }
    } on DioError catch (e) {
      print("Error: ${e.response}");
    }

    return currencyHistoricalEntityList;
  }

  @override
  Future<List<CountryEntity>> getCountriesList() async {
    List<CountryEntity>? currencyEntityList = [];
    try {
      // var response = await _currencyConverterApiService.getCountriesApi();
      // (response.results as Map).toList((e) => currencyEntityList
      //     .add(CountriesModel.fromJson(e.value).toCountryEntity()));

      for (var element in countriesList) {
        currencyEntityList.add(element.toCountryEntity());
      }
    } on DioError catch (e) {
      print("error : ${e.response}");
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
