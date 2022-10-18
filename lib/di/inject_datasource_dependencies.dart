import 'package:dio/dio.dart';

import 'package:currencyconverterapp/data/datasource/local/database/database.dart';
import 'package:currencyconverterapp/data/datasource/remote/api_constant_keys.dart';
import 'package:currencyconverterapp/data/datasource/remote/currency_converter_api_service/currency_converter_api_service.dart';
import 'package:currencyconverterapp/di/injector.dart';

Future<void> initializeDatasourceDependencies() async {
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());

  injector.registerLazySingleton(
      () => Dio()..options.baseUrl = ApiConstantKeys.baseUrl);

  injector.registerLazySingleton<CurrencyConverterApiService>(
      () => CurrencyConverterApiService(injector()));
}
