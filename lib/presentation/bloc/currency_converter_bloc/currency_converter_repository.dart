import 'package:currencyconverterapp/domain/usecases/get_countries_list.dart';
import 'package:currencyconverterapp/domain/usecases/get_currency_historical.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';

abstract class BaseCurrencyConverterRepo {
  Future<CurrencyConverterState> getCountriesList();

  Future<CurrencyConverterState> getCurrencyHistorical();
}

class CurrencyConverterRepoImp extends BaseCurrencyConverterRepo {
  final GetCountiesListUseCase? _getCountiesListUseCase;
  final GetCurrencyHistoricalUseCase? _getCurrencyHistoricalUseCase;

  CurrencyConverterRepoImp(
      this._getCountiesListUseCase, this._getCurrencyHistoricalUseCase);

  @override
  Future<CurrencyConverterState> getCountriesList() async {
    CurrencyConverterState? currencyConverterState;
    try {
      currencyConverterState = GetCountriesListSuccessfullyState(
          countriesList: await _getCountiesListUseCase!.execute());
    } catch (e) {
      currencyConverterState =
          CurrencyConverterErrorState(errorMessage: e.toString());
    }
    return currencyConverterState;
  }

  @override
  Future<CurrencyConverterState> getCurrencyHistorical() async {
    CurrencyConverterState? currencyConverterState;
    try {
      currencyConverterState = GetCurrencyHistoricalListSuccessfullyState(
          currencyHistoricalList:
              await _getCurrencyHistoricalUseCase!.execute());
    } catch (e) {
      currencyConverterState =
          CurrencyConverterErrorState(errorMessage: e.toString());
    }
    return currencyConverterState;
  }
}
