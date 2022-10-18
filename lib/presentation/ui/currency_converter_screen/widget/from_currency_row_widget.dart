import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';

class FormCurrencyRowWidget extends StatelessWidget {
  final TextEditingController? fromCurrencyController;
  final List<CountryEntity>? countriesList;

  const FormCurrencyRowWidget(
      {Key? key, this.fromCurrencyController, this.countriesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              items: getDropDownListItem(),
              value:
                  BlocProvider.of<CurrencyConverterBloc>(context).fromCountryId,
              onChanged: (value) {
                BlocProvider.of<CurrencyConverterBloc>(context)
                    .add(SelectFromCurrencyEvent(fromCountryId: value));
              },
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 40,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: fromCurrencyController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value.isEmpty) {
                    BlocProvider.of<CurrencyConverterBloc>(context).add(
                        const FromCurrencyTextValueChangedEvent(
                            fromCurrency: "0"));
                  } else {
                    BlocProvider.of<CurrencyConverterBloc>(context).add(
                        FromCurrencyTextValueChangedEvent(fromCurrency: value));
                  }
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownListItem() {
    return countriesList!
        .map((country) => DropdownMenuItem<String>(
              value: country.countryId,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    country.countryImage == null || country.countryImage == ""
                        ? const SizedBox()
                        : Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(country.countryImage!),
                              ),
                            ),
                          ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        country.countryName!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
  }
}
