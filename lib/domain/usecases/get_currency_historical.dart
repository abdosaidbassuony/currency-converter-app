import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class GetCurrencyHistoricalUseCase {
  final CurrencyConverterRepository currencyConverterRepository;

  GetCurrencyHistoricalUseCase(this.currencyConverterRepository);

  Future<List<CurrencyHistoricalEntity>> execute(
      {String? startDate,
      String? endDate,
      String? toCurrency,
      String? fromCurrency}) async {
    return await currencyConverterRepository.currencyHistoricalList(
        toCurrency: toCurrency,
        startDate: startDate,
        endDate: endDate,
        fromCurrency: fromCurrency);
  }
}
