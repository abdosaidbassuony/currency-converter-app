import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
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

  CurrencyConverterBloc(this._baseCurrencyConverterRepository)
      : super(CurrencyConverterInitialState()) {
    on<GetCountriesListEvent>(_onGetCountriesListEvent);
    on<SetCountriesListEvent>(_onSetCountriesListEvent);
    on<GetCurrencyHistoricalListEvent>(_onGetCurrencyHistoricalListEvent);
    on<SelectFromCurrencyEvent>(_onSelectFromCurrencyEvent);
    on<SelectToCurrencyEvent>(_onSelectToCurrencyEvent);
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
    emit(await _baseCurrencyConverterRepository.getCurrencyHistorical());
  }

  FutureOr<void> _onSetCountriesListEvent(
      SetCountriesListEvent event, Emitter<CurrencyConverterState> emit) {
    _countriesList = event.countriesList!;
    if (_countriesList.isNotEmpty) {
      fromCurrencyId = _countriesList.first.countryId;
      toCurrencyId = _countriesList.first.countryId;
    }
    emit(SetCountriesListState(countriesList: event.countriesList!));
  }

  FutureOr<void> _onSelectFromCurrencyEvent(SelectFromCurrencyEvent event,
      Emitter<CurrencyConverterState> emit) async {
    fromCurrencyId = event.fromCurrencyId;
    emit(SelectFromCurrencyState(fromCurrencyId: event.fromCurrencyId));
  }

  FutureOr<void> _onSelectToCurrencyEvent(
      SelectToCurrencyEvent event, Emitter<CurrencyConverterState> emit) async {
    toCurrencyId = event.toCurrencyId;
    emit(SelectFromCurrencyState(fromCurrencyId: event.toCurrencyId));
  }
}
