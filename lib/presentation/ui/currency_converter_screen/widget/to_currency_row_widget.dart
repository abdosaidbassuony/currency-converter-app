import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';

class ToCurrencyRowWidget extends StatelessWidget {
  final TextEditingController? toCurrencyController;
  final List<CountryEntity>? countriesList;

  const ToCurrencyRowWidget(
      {Key? key, this.toCurrencyController, this.countriesList})
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
            value: BlocProvider.of<CurrencyConverterBloc>(context).toCurrencyId,
            onChanged: (value) {
              BlocProvider.of<CurrencyConverterBloc>(context)
                  .add(SelectToCurrencyEvent(toCurrencyId: value));
            },
          ),
          const SizedBox(width: 32),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: toCurrencyController,
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
