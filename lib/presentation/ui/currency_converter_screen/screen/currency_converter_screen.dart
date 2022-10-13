import 'package:currencyconverterapp/core/base_widget/base_stateful_widget.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_converter_screen_body_widget.dart';
import 'package:flutter/material.dart';

class CurrencyConverterScreen extends BaseStatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  BaseState<CurrencyConverterScreen> baseCreateState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends BaseState<CurrencyConverterScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return const CurrencyConverterScreenBodyWidget();
  }
}
