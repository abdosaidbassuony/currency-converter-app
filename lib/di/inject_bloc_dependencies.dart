import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_repository.dart';
import 'injector.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<BaseCurrencyConverterRepo>(
      () => CurrencyConverterRepoImp(injector(), injector()));
  injector.registerFactory<CurrencyConverterBloc>(
      () => CurrencyConverterBloc(injector()));
}
