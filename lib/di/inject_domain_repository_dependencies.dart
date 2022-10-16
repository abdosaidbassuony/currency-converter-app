import 'package:currencyconverterapp/data/repository/currency_converter_repository_impl.dart';
import 'package:currencyconverterapp/di/injector.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';


Future<void> initializeDomainRepositoryDependencies() async {
  injector.registerFactory<CurrencyConverterRepository>(
      () => CurrencyConverterRepositoryImpl(injector()));
}
