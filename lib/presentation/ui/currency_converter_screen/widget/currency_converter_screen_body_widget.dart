import 'package:currencyconverterapp/generated/l10n.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_converter_widget.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_historical_widget.dart';
import 'package:flutter/material.dart';

class CurrencyConverterScreenBodyWidget extends StatelessWidget {
  const CurrencyConverterScreenBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(S.current.currencyConverter)),
      body: Column(
        children: const [
          CurrencyConverterWidget(),
          Expanded(child: CurrencyHistoricalWidget())
        ],
      ),
    );
  }
}
