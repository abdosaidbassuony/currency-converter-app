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
  final String? fromCountryId;

  const SelectFromCurrencyEvent({this.fromCountryId});

  @override
  List<Object?> get props => [fromCountryId];
}

class SelectToCurrencyEvent extends CurrencyConverterEvent {
  final String? toCountryId;

  const SelectToCurrencyEvent({this.toCountryId});

  @override
  List<Object?> get props => [toCountryId];
}

class ConvertCurrencyEvent extends CurrencyConverterEvent {
  final String? toCurrencyId;
  final String? fromCurrencyId;

  const ConvertCurrencyEvent({this.toCurrencyId, this.fromCurrencyId});

  @override
  List<Object?> get props => [toCurrencyId, fromCurrencyId];
}

class SetCurrencyValueEvent extends CurrencyConverterEvent {
  final num? currencyValue;

  const SetCurrencyValueEvent({this.currencyValue});

  @override
  List<Object?> get props => [currencyValue];
}

class FromCurrencyTextValueChangedEvent extends CurrencyConverterEvent {
  final String? fromCurrency;

  const FromCurrencyTextValueChangedEvent({this.fromCurrency});

  @override
  List<Object?> get props => [fromCurrency];
}
