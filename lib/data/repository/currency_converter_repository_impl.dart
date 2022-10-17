import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import 'package:currencyconverterapp/core/utils/extensions.dart';
import 'package:currencyconverterapp/data/datasource/local/database/database.dart';
import 'package:currencyconverterapp/data/datasource/remote/currency_converter_api_service/currency_converter_api_service.dart';
import 'package:currencyconverterapp/data/model/countries_model.dart';
import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class CurrencyConverterRepositoryImpl extends CurrencyConverterRepository {
  final CurrencyConverterApiService _currencyConverterApiService;
  final AppDatabase _appDatabase;

  CurrencyConverterRepositoryImpl(
      this._currencyConverterApiService, this._appDatabase);

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
      var countriesListFormDataBase = await _appDatabase.getCountriesList();
      if (countriesListFormDataBase.isEmpty) {
        var response = await _currencyConverterApiService.getCountriesApi();
        (response.results as Map).toList((e) async {
          CountryEntity countriesModel =
              CountriesModel.fromJson(e.value).toCountryEntity();
          return await _appDatabase.insertCountries(CountriesTableCompanion(
              currencySymbol: Value(countriesModel.currencySymbol),
              countryImage: Value(countriesModel.countryImage),
              currencyName: Value(countriesModel.currencyName),
              currencyId: Value(countriesModel.currencyId),
              countryId: Value(countriesModel.countryId),
              countryName: Value(countriesModel.countryName)));
        });
      } else {
        for (var country in countriesListFormDataBase) {
          currencyEntityList.add(CountryEntity(
              countryName: country.countryName,
              countryImage: country.countryImage,
              countryId: country.countryId,
              currencyId: country.currencyId,
              currencyName: country.currencyName,
              currencySymbol: country.currencySymbol));
        }
      }
    } on DioError catch (e) {
      print("error : ${e.response}");
    } catch (e) {
      print("error : ${e.toString()}");
    }
    return currencyEntityList;
  }

  @override
  Future<CurrencyConvertEntity> convertCurrency(
      {String? formCurrencyId, String? toCurrencyId}) async {
    CurrencyConvertEntity? convertEntity;
    try {
      var currencyConvertResponse =
          await _currencyConverterApiService.currencyConvertApi(
              fromToCurrency: "${formCurrencyId}_$toCurrencyId");
      convertEntity = CurrencyConvertEntity(
        currencyValue:
            currencyConvertResponse["${formCurrencyId}_$toCurrencyId"],
      );
    } catch (e) {
      print("error : $e");
    }
    return convertEntity!;
  }
}
