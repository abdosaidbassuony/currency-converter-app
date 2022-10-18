import 'package:flutter/material.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/generated/l10n.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_converter_widget.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_historical_widget.dart';

class CurrencyConverterScreenBodyWidget extends StatelessWidget {
  final List<CountryEntity>? countriesList;
  final List<CurrencyHistoricalEntity>? currencyHistoricalList;
  final TextEditingController? fromCurrencyController;
  final TextEditingController? toCurrencyController;

  const CurrencyConverterScreenBodyWidget(
      {Key? key,
      this.fromCurrencyController,
      this.toCurrencyController,
      this.currencyHistoricalList,
      this.countriesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(S.of(context).currencyConverter)),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: CurrencyConverterWidget(
                    countriesList: countriesList,
                    fromCurrencyController: fromCurrencyController,
                    toCurrencyController: toCurrencyController)),
            Expanded(
                flex: 3,
                child: CurrencyHistoricalWidget(
                    currencyHistoricalList: currencyHistoricalList))
          ],
        ),
      ),
    );
  }
}
