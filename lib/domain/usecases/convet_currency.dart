import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class ConvertCurrencyUseCase {
  final CurrencyConverterRepository currencyConverterRepository;

  ConvertCurrencyUseCase(this.currencyConverterRepository);

  Future<CurrencyConvertEntity> execute(
      {String? formCurrencyId, String? toCurrencyId}) async {
    return await currencyConverterRepository.convertCurrency(
        formCurrencyId: formCurrencyId, toCurrencyId: toCurrencyId);
  }
}
