import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currecny_value_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_repository.dart';

part 'currency_converter_event.dart';
part 'currency_converter_state.dart';

class CurrencyConverterBloc
    extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  final BaseCurrencyConverterRepo _baseCurrencyConverterRepository;
  List<CountryEntity> _countriesList = [];
  String? fromCurrencyId;
  String? toCurrencyId;
  String? fromCountryId;
  String? toCountryId;
  num? currencyValue;

  CurrencyConverterBloc(this._baseCurrencyConverterRepository)
      : super(CurrencyConverterInitialState()) {
    on<GetCountriesListEvent>(_onGetCountriesListEvent);
    on<SetCountriesListEvent>(_onSetCountriesListEvent);
    on<GetCurrencyHistoricalListEvent>(_onGetCurrencyHistoricalListEvent);
    on<SelectFromCurrencyEvent>(_onSelectFromCurrencyEvent);
    on<SelectToCurrencyEvent>(_onSelectToCurrencyEvent);
    on<ConvertCurrencyEvent>(_onConvertCurrencyEvent);
    on<SetCurrencyValueEvent>(_onSetCurrencyValueEvent);
    on<FromCurrencyTextValueChangedEvent>(_onFromCurrencyTextValueChangedEvent);
  }

  FutureOr<void> _onGetCountriesListEvent(
      GetCountriesListEvent event, Emitter<CurrencyConverterState> emit) async {
    emit(CurrencyConverterLoadingState());
    emit(await _baseCurrencyConverterRepository.getCountriesList());
  }

  FutureOr<void> _onGetCurrencyHistoricalListEvent(
      GetCurrencyHistoricalListEvent event,
      Emitter<CurrencyConverterState> emit) async {
    emit(CurrencyConverterLoadingState());
    emit(await _baseCurrencyConverterRepository.getCurrencyHistorical(
        toCurrency: toCurrencyId, fromCurrency: fromCurrencyId));
  }

  FutureOr<void> _onSetCountriesListEvent(
      SetCountriesListEvent event, Emitter<CurrencyConverterState> emit) {
    _countriesList = event.countriesList!;
    if (_countriesList.isNotEmpty) {
      fromCurrencyId = _countriesList.first.currencyId;
      toCurrencyId = _countriesList.first.currencyId;
      fromCountryId = _countriesList.first.countryId;
      toCountryId = _countriesList.first.countryId;
    }
    emit(SetCountriesListState(countriesList: event.countriesList!));
  }

  FutureOr<void> _onSelectFromCurrencyEvent(SelectFromCurrencyEvent event,
      Emitter<CurrencyConverterState> emit) async {
    fromCountryId = event.fromCountryId;
    fromCurrencyId = _countriesList
        .firstWhere((element) => element.countryId == event.fromCountryId)
        .currencyId;
    emit(SelectFromCurrencyState(fromCurrencyId: event.fromCountryId));
  }

  FutureOr<void> _onSelectToCurrencyEvent(
      SelectToCurrencyEvent event, Emitter<CurrencyConverterState> emit) async {
    toCountryId = event.toCountryId;

    toCurrencyId = _countriesList
        .firstWhere((element) => element.countryId == event.toCountryId)
        .currencyId;
    emit(SelectToCurrencyState(toCurrencyId: event.toCountryId));
  }

  FutureOr<void> _onConvertCurrencyEvent(
      ConvertCurrencyEvent event, Emitter<CurrencyConverterState> emit) async {
    emit(CurrencyConverterLoadingState());
    emit(await _baseCurrencyConverterRepository.convertCurrency(
        formCurrencyId: fromCurrencyId, toCurrencyId: toCurrencyId));
  }

  FutureOr<void> _onSetCurrencyValueEvent(
      SetCurrencyValueEvent event, Emitter<CurrencyConverterState> emit) {
    currencyValue = event.currencyValue;
  }

  FutureOr<void> _onFromCurrencyTextValueChangedEvent(
      FromCurrencyTextValueChangedEvent event,
      Emitter<CurrencyConverterState> emit) {
    String toCurrencyValue =
        (double.parse(event.fromCurrency!) * currencyValue!).toString();
    print("toCurrencyValue $toCurrencyValue");
    emit(FromCurrencyTextValueChangedState(toCurrencyValue: toCurrencyValue));
  }
}
