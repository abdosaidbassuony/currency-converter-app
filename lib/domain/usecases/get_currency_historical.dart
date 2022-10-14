import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class GetCurrencyHistoricalUseCase {
  final CurrencyConverterRepository currencyConverterRepository;

  GetCurrencyHistoricalUseCase(this.currencyConverterRepository);

  Future<List<CurrencyHistoricalEntity>> execute() async {
    return await currencyConverterRepository.currencyHistoricalList();
  }
}
