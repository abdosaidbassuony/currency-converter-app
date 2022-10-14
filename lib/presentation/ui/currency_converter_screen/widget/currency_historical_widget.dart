import 'package:flutter/material.dart';

import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';
import 'package:currencyconverterapp/presentation/ui/currency_converter_screen/widget/currency_historical_item_widget.dart';

class CurrencyHistoricalWidget extends StatelessWidget {
  final List<CurrencyHistoricalEntity>? currencyHistoricalList;

  const CurrencyHistoricalWidget({Key? key, this.currencyHistoricalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencyHistoricalList!.length,
      itemBuilder: (context, index) => CurrencyHistoricalItemWidget(
          currencyHistoricalItem: currencyHistoricalList![index]),
    );
  }
}
