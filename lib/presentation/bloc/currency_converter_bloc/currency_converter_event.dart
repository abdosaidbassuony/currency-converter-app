part of 'currency_converter_bloc.dart';

abstract class CurrencyConverterEvent extends Equatable {
  const CurrencyConverterEvent();

  @override
  List<Object?> get props => [];
}

class GetCountriesListEvent extends CurrencyConverterEvent {}

class SetCountriesListEvent extends CurrencyConverterEvent {
  final List<CountryEntity>? countriesList;

  const SetCountriesListEvent({this.countriesList});

  @override
  List<Object?> get props => [countriesList];
}

class GetCurrencyHistoricalListEvent extends CurrencyConverterEvent {
  final String? fromCurrencyId;
  final String? toCurrencyId;

  const GetCurrencyHistoricalListEvent(
      {this.fromCurrencyId, this.toCurrencyId});

  @override
  List<Object?> get props => [fromCurrencyId, toCurrencyId];
}

class SelectFromCurrencyEvent extends CurrencyConverterEvent {
  final String? fromCurrencyId;

  const SelectFromCurrencyEvent({this.fromCurrencyId});

  @override
  List<Object?> get props => [fromCurrencyId];
}

class SelectToCurrencyEvent extends CurrencyConverterEvent {
  final String? toCurrencyId;

  const SelectToCurrencyEvent({this.toCurrencyId});

  @override
  List<Object?> get props => [toCurrencyId];
}

class ConvertCurrencyEvent extends CurrencyConverterEvent {
  final String? toCurrencyId;
  final String? fromCurrencyId;

  const ConvertCurrencyEvent({this.toCurrencyId, this.fromCurrencyId});

  @override
  List<Object?> get props => [toCurrencyId, fromCurrencyId];
}
