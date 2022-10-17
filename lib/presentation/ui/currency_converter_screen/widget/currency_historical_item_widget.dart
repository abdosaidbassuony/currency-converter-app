import 'package:flutter/material.dart';

import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';

class CurrencyHistoricalItemWidget extends StatelessWidget {
  final CurrencyHistoricalEntity? currencyHistoricalItem;

  const CurrencyHistoricalItemWidget({Key? key, this.currencyHistoricalItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("From: "),
                    Text(currencyHistoricalItem!.formCurrency!)
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text("To: "),
                    Text(currencyHistoricalItem!.toCurrency!)
                  ],
                ),
              ],
            ),
            Text(currencyHistoricalItem!.currencyValue.toString())
          ],
        ),
      ),
    );
  }
}
