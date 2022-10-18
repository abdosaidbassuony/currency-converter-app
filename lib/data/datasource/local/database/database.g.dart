// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CountriesTableData extends DataClass
    implements Insertable<CountriesTableData> {
  final String? countryId;
  final String? countryName;
  final String? currencySymbol;
  final String? currencyName;
  final String? currencyId;
  final String? countryImage;
  const CountriesTableData(
      {this.countryId,
      this.countryName,
      this.currencySymbol,
      this.currencyName,
      this.currencyId,
      this.countryImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String>(countryId);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String>(countryName);
    }
    if (!nullToAbsent || currencySymbol != null) {
      map['currency_symbol'] = Variable<String>(currencySymbol);
    }
    if (!nullToAbsent || currencyName != null) {
      map['currency_name'] = Variable<String>(currencyName);
    }
    if (!nullToAbsent || currencyId != null) {
      map['currency_id'] = Variable<String>(currencyId);
    }
    if (!nullToAbsent || countryImage != null) {
      map['country_image'] = Variable<String>(countryImage);
    }
    return map;
  }

  CountriesTableCompanion toCompanion(bool nullToAbsent) {
    return CountriesTableCompanion(
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      currencySymbol: currencySymbol == null && nullToAbsent
          ? const Value.absent()
          : Value(currencySymbol),
      currencyName: currencyName == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyName),
      currencyId: currencyId == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyId),
      countryImage: countryImage == null && nullToAbsent
          ? const Value.absent()
          : Value(countryImage),
    );
  }

  factory CountriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountriesTableData(
      countryId: serializer.fromJson<String?>(json['countryId']),
      countryName: serializer.fromJson<String?>(json['countryName']),
      currencySymbol: serializer.fromJson<String?>(json['currencySymbol']),
      currencyName: serializer.fromJson<String?>(json['currencyName']),
      currencyId: serializer.fromJson<String?>(json['currencyId']),
      countryImage: serializer.fromJson<String?>(json['countryImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'countryId': serializer.toJson<String?>(countryId),
      'countryName': serializer.toJson<String?>(countryName),
      'currencySymbol': serializer.toJson<String?>(currencySymbol),
      'currencyName': serializer.toJson<String?>(currencyName),
      'currencyId': serializer.toJson<String?>(currencyId),
      'countryImage': serializer.toJson<String?>(countryImage),
    };
  }

  CountriesTableData copyWith(
          {Value<String?> countryId = const Value.absent(),
          Value<String?> countryName = const Value.absent(),
          Value<String?> currencySymbol = const Value.absent(),
          Value<String?> currencyName = const Value.absent(),
          Value<String?> currencyId = const Value.absent(),
          Value<String?> countryImage = const Value.absent()}) =>
      CountriesTableData(
        countryId: countryId.present ? countryId.value : this.countryId,
        countryName: countryName.present ? countryName.value : this.countryName,
        currencySymbol:
            currencySymbol.present ? currencySymbol.value : this.currencySymbol,
        currencyName:
            currencyName.present ? currencyName.value : this.currencyName,
        currencyId: currencyId.present ? currencyId.value : this.currencyId,
        countryImage:
            countryImage.present ? countryImage.value : this.countryImage,
      );
  @override
  String toString() {
    return (StringBuffer('CountriesTableData(')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('currencyName: $currencyName, ')
          ..write('currencyId: $currencyId, ')
          ..write('countryImage: $countryImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(countryId, countryName, currencySymbol,
      currencyName, currencyId, countryImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountriesTableData &&
          other.countryId == this.countryId &&
          other.countryName == this.countryName &&
          other.currencySymbol == this.currencySymbol &&
          other.currencyName == this.currencyName &&
          other.currencyId == this.currencyId &&
          other.countryImage == this.countryImage);
}

class CountriesTableCompanion extends UpdateCompanion<CountriesTableData> {
  final Value<String?> countryId;
  final Value<String?> countryName;
  final Value<String?> currencySymbol;
  final Value<String?> currencyName;
  final Value<String?> currencyId;
  final Value<String?> countryImage;
  const CountriesTableCompanion({
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.currencyName = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.countryImage = const Value.absent(),
  });
  CountriesTableCompanion.insert({
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.currencyName = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.countryImage = const Value.absent(),
  });
  static Insertable<CountriesTableData> custom({
    Expression<String>? countryId,
    Expression<String>? countryName,
    Expression<String>? currencySymbol,
    Expression<String>? currencyName,
    Expression<String>? currencyId,
    Expression<String>? countryImage,
  }) {
    return RawValuesInsertable({
      if (countryId != null) 'country_id': countryId,
      if (countryName != null) 'country_name': countryName,
      if (currencySymbol != null) 'currency_symbol': currencySymbol,
      if (currencyName != null) 'currency_name': currencyName,
      if (currencyId != null) 'currency_id': currencyId,
      if (countryImage != null) 'country_image': countryImage,
    });
  }

  CountriesTableCompanion copyWith(
      {Value<String?>? countryId,
      Value<String?>? countryName,
      Value<String?>? currencySymbol,
      Value<String?>? currencyName,
      Value<String?>? currencyId,
      Value<String?>? countryImage}) {
    return CountriesTableCompanion(
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      currencyName: currencyName ?? this.currencyName,
      currencyId: currencyId ?? this.currencyId,
      countryImage: countryImage ?? this.countryImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (currencySymbol.present) {
      map['currency_symbol'] = Variable<String>(currencySymbol.value);
    }
    if (currencyName.present) {
      map['currency_name'] = Variable<String>(currencyName.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<String>(currencyId.value);
    }
    if (countryImage.present) {
      map['country_image'] = Variable<String>(countryImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesTableCompanion(')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('currencyName: $currencyName, ')
          ..write('currencyId: $currencyId, ')
          ..write('countryImage: $countryImage')
          ..write(')'))
        .toString();
  }
}

class $CountriesTableTable extends CountriesTable
    with TableInfo<$CountriesTableTable, CountriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
      'country_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  final VerificationMeta _countryNameMeta =
      const VerificationMeta('countryName');
  @override
  late final GeneratedColumn<String> countryName = GeneratedColumn<String>(
      'country_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _currencySymbolMeta =
      const VerificationMeta('currencySymbol');
  @override
  late final GeneratedColumn<String> currencySymbol = GeneratedColumn<String>(
      'currency_symbol', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _currencyNameMeta =
      const VerificationMeta('currencyName');
  @override
  late final GeneratedColumn<String> currencyName = GeneratedColumn<String>(
      'currency_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _currencyIdMeta = const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
      'currency_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _countryImageMeta =
      const VerificationMeta('countryImage');
  @override
  late final GeneratedColumn<String> countryImage = GeneratedColumn<String>(
      'country_image', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        countryId,
        countryName,
        currencySymbol,
        currencyName,
        currencyId,
        countryImage
      ];
  @override
  String get aliasedName => _alias ?? 'countries_table';
  @override
  String get actualTableName => 'countries_table';
  @override
  VerificationContext validateIntegrity(Insertable<CountriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('country_name')) {
      context.handle(
          _countryNameMeta,
          countryName.isAcceptableOrUnknown(
              data['country_name']!, _countryNameMeta));
    }
    if (data.containsKey('currency_symbol')) {
      context.handle(
          _currencySymbolMeta,
          currencySymbol.isAcceptableOrUnknown(
              data['currency_symbol']!, _currencySymbolMeta));
    }
    if (data.containsKey('currency_name')) {
      context.handle(
          _currencyNameMeta,
          currencyName.isAcceptableOrUnknown(
              data['currency_name']!, _currencyNameMeta));
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    }
    if (data.containsKey('country_image')) {
      context.handle(
          _countryImageMeta,
          countryImage.isAcceptableOrUnknown(
              data['country_image']!, _countryImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CountriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountriesTableData(
      countryId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}country_id']),
      countryName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}country_name']),
      currencySymbol: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}currency_symbol']),
      currencyName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}currency_name']),
      currencyId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}currency_id']),
      countryImage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}country_image']),
    );
  }

  @override
  $CountriesTableTable createAlias(String alias) {
    return $CountriesTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CountriesTableTable countriesTable = $CountriesTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countriesTable];
}
