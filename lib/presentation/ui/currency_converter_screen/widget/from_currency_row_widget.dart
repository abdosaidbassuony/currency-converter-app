import 'package:currencyconverterapp/data/datasource/local/dummydata/countries_list.dart';
import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:flutter/material.dart';

class FormCurrencyRowWidget extends StatelessWidget {
  const FormCurrencyRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<CountryEntity>(
          items: getDropDownListItem(),
          value: countriesList.first.toCountryEntity(),
          onChanged: (value) {},
        )
      ],
    );
  }

  List<DropdownMenuItem<CountryEntity>> getDropDownListItem() {
    return countriesList
        .map((country) => DropdownMenuItem<CountryEntity>(
              value: country.toCountryEntity(),
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
                              image: NetworkImage(country.countryImage!),
                            ),
                          ),
                        ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      country.countryName!,
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }
}
