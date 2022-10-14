import 'package:flutter/material.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/from_currency_row_widget.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/to_currency_row_widget.dart';

class CurrencyConverterWidget extends StatelessWidget {
  final List<CountryEntity>? countriesList;
  final TextEditingController? fromCurrencyController;
  final TextEditingController? toCurrencyController;

  const CurrencyConverterWidget({
    Key? key,
    this.toCurrencyController,
    this.fromCurrencyController,
    this.countriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FormCurrencyRowWidget(
                  countriesList: countriesList,
                  fromCurrencyController: fromCurrencyController)),
          Expanded(
              child: ToCurrencyRowWidget(
                  countriesList: countriesList,
                  toCurrencyController: toCurrencyController))
        ],
      ),
    );
  }
}
