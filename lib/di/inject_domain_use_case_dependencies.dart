import 'package:currencyconverterapp/domain/usecases/get_countries_list.dart';
import 'package:currencyconverterapp/domain/usecases/get_currency_historical.dart';
import 'injector.dart';

Future<void> initializeDomainUseCaseDependencies() async {
  injector.registerFactory<GetCountiesListUseCase>(
      () => GetCountiesListUseCase(injector()));

  injector.registerFactory<GetCurrencyHistoricalUseCase>(
      () => GetCurrencyHistoricalUseCase(injector()));
}
