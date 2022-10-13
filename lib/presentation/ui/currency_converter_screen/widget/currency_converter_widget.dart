import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/from_currency_row_widget.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/to_currency_row_widget.dart';
import 'package:flutter/material.dart';

class CurrencyConverterWidget extends StatelessWidget {
  const CurrencyConverterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: FormCurrencyRowWidget()),
        ToCurrencyRowWidget()
      ],
    );
  }
}
