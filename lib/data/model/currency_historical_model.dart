import 'package:currencyconverterapp/data/datasource/local/dummydata/countries_list.dart';
import 'package:currencyconverterapp/domain/entity/currency_historical_entity.dart';

class CurrencyHistoricalModel {
  double? currencyValue;
  String? formCountryId;
  String? toCountryId;

  CurrencyHistoricalModel(
      {this.currencyValue, this.formCountryId, this.toCountryId});

  CurrencyHistoricalEntity toCurrencyHistoricalEntity() {
    return CurrencyHistoricalEntity(
      formCurrency: countriesList
          .firstWhere((element) => element.countryId == formCountryId)
          .toCountryEntity(),
      toCurrency: countriesList
          .firstWhere((element) => element.countryId == toCountryId)
          .toCountryEntity(),
      currencyValue: currencyValue,
    );
  }
}
