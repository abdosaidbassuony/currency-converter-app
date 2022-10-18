import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:currencyconverterapp/data/datasource/remote/api_constant_keys.dart';
import 'package:currencyconverterapp/data/model/Result.dart';

part 'currency_converter_api_service.g.dart';

@RestApi()
abstract class CurrencyConverterApiService {
  factory CurrencyConverterApiService(Dio dio) = _CurrencyConverterApiService;

  @GET(ApiConstantKeys.convertKey)
  Future currencyConvertApi({
    @Query("q") String? fromToCurrency,
    @Query("compact") String? compact = "ultra",
    @Query("apiKey") String? apiKey = ApiConstantKeys.apiKey,
  });

  @GET(ApiConstantKeys.countriesKey)
  Future<Result> getCountriesApi({
    @Query("apiKey") String? apiKey = ApiConstantKeys.apiKey,
  });

  @GET(ApiConstantKeys.convertKey)
  Future getCurrencyHistoricalApi({
    @Query("q") String? fromToCurrency,
    @Query("compact") String? compact = "ultra",
    @Query("date") String? startDate,
    @Query("endDate") String? endDate,
    @Query("apiKey") String? apiKey = ApiConstantKeys.apiKey,
  });
}
