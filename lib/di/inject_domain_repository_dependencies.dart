import 'package:currencyconverterapp/data/repository/currency_converter_repository_impl.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';
import 'injector.dart';

Future<void> initializeDomainRepositoryDependencies() async {
  injector.registerFactory<CurrencyConverterRepository>(
      () => CurrencyConverterRepositoryImpl());
}
