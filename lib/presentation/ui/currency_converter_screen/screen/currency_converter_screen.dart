import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currencyconverterapp/core/base_widget/base_stateful_widget.dart';
import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_converter_screen_body_widget.dart';

class CurrencyConverterScreen extends BaseStatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  BaseState<CurrencyConverterScreen> baseCreateState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends BaseState<CurrencyConverterScreen> {
  TextEditingController fromCurrencyController = TextEditingController();
  TextEditingController toCurrencyController = TextEditingController();
  List<CountryEntity> _countriesList = [];
  List<CurrencyHistoricalEntity> _currencyHistoricalList = [];

  @override
  void initState() {
    fromCurrencyController.text = "1";
    BlocProvider.of<CurrencyConverterBloc>(context)
        .add(GetCountriesListEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<CurrencyConverterBloc, CurrencyConverterState>(
      listener: (context, state) {
        if (state is CurrencyConverterLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is CurrencyConverterErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        } else if (state is GetCountriesListSuccessfullyState) {
          BlocProvider.of<CurrencyConverterBloc>(context)
              .add(SetCountriesListEvent(countriesList: state.countriesList));
        } else if (state is SetCountriesListState) {
          _countriesList = state.countriesList!;
          BlocProvider.of<CurrencyConverterBloc>(context)
              .add(const ConvertCurrencyEvent());
        } else if (state is ConvertCurrencyState) {
          BlocProvider.of<CurrencyConverterBloc>(context).add(
              SetCurrencyValueEvent(
                  currencyValue: state.currencyConvertEntity!.currencyValue));
          _resetCurrencyTextControllerValue(state);
          BlocProvider.of<CurrencyConverterBloc>(context)
              .add(const GetCurrencyHistoricalListEvent());
        } else if (state is GetCurrencyHistoricalListSuccessfullyState) {
          _currencyHistoricalList = state.currencyHistoricalList!;
        } else if (state is SelectFromCurrencyState) {
          BlocProvider.of<CurrencyConverterBloc>(context)
              .add(const ConvertCurrencyEvent());
        } else if (state is SelectToCurrencyState) {
          BlocProvider.of<CurrencyConverterBloc>(context)
              .add(const ConvertCurrencyEvent());
        } else if (state is FromCurrencyTextValueChangedState) {
          toCurrencyController.text = state.toCurrencyValue!;
        }
      },
      builder: (context, state) {
        if (state is SetCountriesListState) {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        } else if (state is GetCurrencyHistoricalListSuccessfullyState) {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        } else if (state is SelectFromCurrencyState) {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        } else if (state is SelectToCurrencyState) {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        } else if (state is FromCurrencyTextValueChangedState) {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        } else {
          return CurrencyConverterScreenBodyWidget(
              countriesList: _countriesList,
              currencyHistoricalList: _currencyHistoricalList,
              fromCurrencyController: fromCurrencyController,
              toCurrencyController: toCurrencyController);
        }
      },
    );
  }

  void _resetCurrencyTextControllerValue(ConvertCurrencyState state) {
    fromCurrencyController.text = "1";
    toCurrencyController.text =
        state.currencyConvertEntity!.currencyValue.toString();
  }
}
