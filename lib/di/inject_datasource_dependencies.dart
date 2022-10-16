import 'package:currencyconverterapp/data/datasource/remote/api_constant_keys.dart';
import 'package:currencyconverterapp/data/datasource/remote/currency_converter_api_service/currency_converter_api_service.dart';
import 'package:currencyconverterapp/di/injector.dart';
import 'package:dio/dio.dart';

Future<void> initializeDatasourceDependencies() async {
  injector.registerLazySingleton(
      () => Dio()..options.baseUrl = ApiConstantKeys.baseUrl);

  injector.registerLazySingleton<CurrencyConverterApiService>(
      () => CurrencyConverterApiService(injector()));
}
