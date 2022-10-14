part of 'currency_converter_bloc.dart';

abstract class CurrencyConverterState extends Equatable {
  const CurrencyConverterState();

  @override
  List<Object?> get props => [];
}

class CurrencyConverterInitialState extends CurrencyConverterState {}

class CurrencyConverterLoadingState extends CurrencyConverterState {}

class CurrencyConverterErrorState extends CurrencyConverterState {
  final String? errorMessage;

  const CurrencyConverterErrorState({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class GetCountriesListSuccessfullyState extends CurrencyConverterState {
  final List<CountryEntity>? countriesList;

  const GetCountriesListSuccessfullyState({this.countriesList});

  @override
  List<Object?> get props => [countriesList];
}

class SetCountriesListState extends CurrencyConverterState {
  final List<CountryEntity>? countriesList;

  const SetCountriesListState({this.countriesList});

  @override
  List<Object?> get props => [countriesList];
}

class GetCurrencyHistoricalListSuccessfullyState
    extends CurrencyConverterState {
  final List<CurrencyHistoricalEntity>? currencyHistoricalList;

  const GetCurrencyHistoricalListSuccessfullyState(
      {this.currencyHistoricalList});

  @override
  List<Object?> get props => [currencyHistoricalList];
}

class SelectFromCurrencyState extends CurrencyConverterState {
  final String? fromCurrencyId;

  const SelectFromCurrencyState({this.fromCurrencyId});

  @override
  List<Object?> get props => [fromCurrencyId];
}

class SelectToCurrencyState extends CurrencyConverterState {
  final String? toCurrencyId;

  const SelectToCurrencyState({this.toCurrencyId});

  @override
  List<Object?> get props => [toCurrencyId];
}
