import 'package:currencyconverterapp/data/model/country_model.dart';
import 'package:currencyconverterapp/core/utils/resources/image_path.dart';

List<CountryModel> countriesList = [
  CountryModel(
      countryId: "0",
      countryCurrencyCode: "EG",
      countryName: "Egypt",
      countryImage: ImagePath.egyptFlagImage),
  CountryModel(
      countryId: "1",
      countryCurrencyCode: "KWD",
      countryName: "Kuwait",
      countryImage: ImagePath.kuwaitFlagImage),
  CountryModel(
      countryId: "3",
      countryCurrencyCode: "SAR",
      countryName: "Saudi Arabia ",
      countryImage: ImagePath.saudiArabiaFlagImage),
  CountryModel(
      countryId: "2",
      countryCurrencyCode: "USA",
      countryName: "USA",
      countryImage: ImagePath.usaFlagImage),
];
