import 'package:drift/drift.dart';

class CountriesTable extends Table {
  TextColumn get countryId => text().withDefault(const Constant("")).nullable()();

  TextColumn get countryName => text().withDefault(const Constant('')).nullable()();

  TextColumn get currencySymbol =>
      text().withDefault(const Constant('')).nullable()();

  TextColumn get currencyName =>
      text().withDefault(const Constant('')).nullable()();

  TextColumn get currencyId =>
      text().withDefault(const Constant('')).nullable()();

  TextColumn get countryImage =>
      text().withDefault(const Constant('')).nullable()();
}
