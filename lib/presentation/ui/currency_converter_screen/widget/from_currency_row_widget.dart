import 'package:flutter/material.dart';

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
          DropdownButton<String>(
            items: getDropDownListItem(),
            value:
                BlocProvider.of<CurrencyConverterBloc>(context).fromCurrencyId,
            onChanged: (value) {
              BlocProvider.of<CurrencyConverterBloc>(context)
                  .add(SelectFromCurrencyEvent(fromCurrencyId: value));
            },
          ),
          const SizedBox(width: 32),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: fromCurrencyController,
                textAlign: TextAlign.center,
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
              child: Row(
                children: [
                  country.countryImage == null || country.countryImage == ""
                      ? const SizedBox()
                      : Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(country.countryImage!),
                            ),
                          ),
                        ),
                  const SizedBox(width: 10),
                  Text(
                    country.countryName!,
                  )
                ],
              ),
            ))
        .toList();
  }
}
