import 'package:currencyconverterapp/domain/entity/country_entity.dart';
import 'package:currencyconverterapp/domain/repository/currency_converter_repository.dart';

class GetCountiesList {
  final CurrencyConverterRepository currencyConverterRepository;

  GetCountiesList(this.currencyConverterRepository);

  Future<List<CountryEntity>> execute() async {
    return await currencyConverterRepository.getCountriesList();
  }
}
