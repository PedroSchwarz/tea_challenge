// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FoodRecordEntryTable extends FoodRecordEntry
    with TableInfo<$FoodRecordEntryTable, FoodRecordEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodRecordEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesPerPortionMeta =
      const VerificationMeta('caloriesPerPortion');
  @override
  late final GeneratedColumn<double> caloriesPerPortion =
      GeneratedColumn<double>(
        'calories_per_portion',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _portionSizeMeta = const VerificationMeta(
    'portionSize',
  );
  @override
  late final GeneratedColumn<double> portionSize = GeneratedColumn<double>(
    'portion_size',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    name,
    caloriesPerPortion,
    portionSize,
    carbs,
    protein,
    fat,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_record_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodRecordEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('calories_per_portion')) {
      context.handle(
        _caloriesPerPortionMeta,
        caloriesPerPortion.isAcceptableOrUnknown(
          data['calories_per_portion']!,
          _caloriesPerPortionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_caloriesPerPortionMeta);
    }
    if (data.containsKey('portion_size')) {
      context.handle(
        _portionSizeMeta,
        portionSize.isAcceptableOrUnknown(
          data['portion_size']!,
          _portionSizeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_portionSizeMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodRecordEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodRecordEntryData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      caloriesPerPortion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}calories_per_portion'],
          )!,
      portionSize:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}portion_size'],
          )!,
      carbs:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}carbs'],
          )!,
      protein:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}protein'],
          )!,
      fat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}fat'],
          )!,
    );
  }

  @override
  $FoodRecordEntryTable createAlias(String alias) {
    return $FoodRecordEntryTable(attachedDatabase, alias);
  }
}

class FoodRecordEntryData extends DataClass
    implements Insertable<FoodRecordEntryData> {
  final int id;
  final DateTime createdAt;
  final String name;
  final double caloriesPerPortion;
  final double portionSize;
  final double carbs;
  final double protein;
  final double fat;
  const FoodRecordEntryData({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.caloriesPerPortion,
    required this.portionSize,
    required this.carbs,
    required this.protein,
    required this.fat,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['calories_per_portion'] = Variable<double>(caloriesPerPortion);
    map['portion_size'] = Variable<double>(portionSize);
    map['carbs'] = Variable<double>(carbs);
    map['protein'] = Variable<double>(protein);
    map['fat'] = Variable<double>(fat);
    return map;
  }

  FoodRecordEntryCompanion toCompanion(bool nullToAbsent) {
    return FoodRecordEntryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      caloriesPerPortion: Value(caloriesPerPortion),
      portionSize: Value(portionSize),
      carbs: Value(carbs),
      protein: Value(protein),
      fat: Value(fat),
    );
  }

  factory FoodRecordEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodRecordEntryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      caloriesPerPortion: serializer.fromJson<double>(
        json['caloriesPerPortion'],
      ),
      portionSize: serializer.fromJson<double>(json['portionSize']),
      carbs: serializer.fromJson<double>(json['carbs']),
      protein: serializer.fromJson<double>(json['protein']),
      fat: serializer.fromJson<double>(json['fat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'caloriesPerPortion': serializer.toJson<double>(caloriesPerPortion),
      'portionSize': serializer.toJson<double>(portionSize),
      'carbs': serializer.toJson<double>(carbs),
      'protein': serializer.toJson<double>(protein),
      'fat': serializer.toJson<double>(fat),
    };
  }

  FoodRecordEntryData copyWith({
    int? id,
    DateTime? createdAt,
    String? name,
    double? caloriesPerPortion,
    double? portionSize,
    double? carbs,
    double? protein,
    double? fat,
  }) => FoodRecordEntryData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    name: name ?? this.name,
    caloriesPerPortion: caloriesPerPortion ?? this.caloriesPerPortion,
    portionSize: portionSize ?? this.portionSize,
    carbs: carbs ?? this.carbs,
    protein: protein ?? this.protein,
    fat: fat ?? this.fat,
  );
  FoodRecordEntryData copyWithCompanion(FoodRecordEntryCompanion data) {
    return FoodRecordEntryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      caloriesPerPortion:
          data.caloriesPerPortion.present
              ? data.caloriesPerPortion.value
              : this.caloriesPerPortion,
      portionSize:
          data.portionSize.present ? data.portionSize.value : this.portionSize,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodRecordEntryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('caloriesPerPortion: $caloriesPerPortion, ')
          ..write('portionSize: $portionSize, ')
          ..write('carbs: $carbs, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    name,
    caloriesPerPortion,
    portionSize,
    carbs,
    protein,
    fat,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodRecordEntryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.caloriesPerPortion == this.caloriesPerPortion &&
          other.portionSize == this.portionSize &&
          other.carbs == this.carbs &&
          other.protein == this.protein &&
          other.fat == this.fat);
}

class FoodRecordEntryCompanion extends UpdateCompanion<FoodRecordEntryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<double> caloriesPerPortion;
  final Value<double> portionSize;
  final Value<double> carbs;
  final Value<double> protein;
  final Value<double> fat;
  const FoodRecordEntryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.caloriesPerPortion = const Value.absent(),
    this.portionSize = const Value.absent(),
    this.carbs = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
  });
  FoodRecordEntryCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    required double caloriesPerPortion,
    required double portionSize,
    required double carbs,
    required double protein,
    required double fat,
  }) : name = Value(name),
       caloriesPerPortion = Value(caloriesPerPortion),
       portionSize = Value(portionSize),
       carbs = Value(carbs),
       protein = Value(protein),
       fat = Value(fat);
  static Insertable<FoodRecordEntryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<double>? caloriesPerPortion,
    Expression<double>? portionSize,
    Expression<double>? carbs,
    Expression<double>? protein,
    Expression<double>? fat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (caloriesPerPortion != null)
        'calories_per_portion': caloriesPerPortion,
      if (portionSize != null) 'portion_size': portionSize,
      if (carbs != null) 'carbs': carbs,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
    });
  }

  FoodRecordEntryCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? name,
    Value<double>? caloriesPerPortion,
    Value<double>? portionSize,
    Value<double>? carbs,
    Value<double>? protein,
    Value<double>? fat,
  }) {
    return FoodRecordEntryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      caloriesPerPortion: caloriesPerPortion ?? this.caloriesPerPortion,
      portionSize: portionSize ?? this.portionSize,
      carbs: carbs ?? this.carbs,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (caloriesPerPortion.present) {
      map['calories_per_portion'] = Variable<double>(caloriesPerPortion.value);
    }
    if (portionSize.present) {
      map['portion_size'] = Variable<double>(portionSize.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodRecordEntryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('caloriesPerPortion: $caloriesPerPortion, ')
          ..write('portionSize: $portionSize, ')
          ..write('carbs: $carbs, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }
}

class $WaterRecordEntryTable extends WaterRecordEntry
    with TableInfo<$WaterRecordEntryTable, WaterRecordEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterRecordEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _amountInMlMeta = const VerificationMeta(
    'amountInMl',
  );
  @override
  late final GeneratedColumn<double> amountInMl = GeneratedColumn<double>(
    'amount_in_ml',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, amountInMl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_record_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaterRecordEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('amount_in_ml')) {
      context.handle(
        _amountInMlMeta,
        amountInMl.isAcceptableOrUnknown(
          data['amount_in_ml']!,
          _amountInMlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountInMlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterRecordEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterRecordEntryData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      amountInMl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount_in_ml'],
          )!,
    );
  }

  @override
  $WaterRecordEntryTable createAlias(String alias) {
    return $WaterRecordEntryTable(attachedDatabase, alias);
  }
}

class WaterRecordEntryData extends DataClass
    implements Insertable<WaterRecordEntryData> {
  final int id;
  final DateTime createdAt;
  final double amountInMl;
  const WaterRecordEntryData({
    required this.id,
    required this.createdAt,
    required this.amountInMl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['amount_in_ml'] = Variable<double>(amountInMl);
    return map;
  }

  WaterRecordEntryCompanion toCompanion(bool nullToAbsent) {
    return WaterRecordEntryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      amountInMl: Value(amountInMl),
    );
  }

  factory WaterRecordEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterRecordEntryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      amountInMl: serializer.fromJson<double>(json['amountInMl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'amountInMl': serializer.toJson<double>(amountInMl),
    };
  }

  WaterRecordEntryData copyWith({
    int? id,
    DateTime? createdAt,
    double? amountInMl,
  }) => WaterRecordEntryData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    amountInMl: amountInMl ?? this.amountInMl,
  );
  WaterRecordEntryData copyWithCompanion(WaterRecordEntryCompanion data) {
    return WaterRecordEntryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      amountInMl:
          data.amountInMl.present ? data.amountInMl.value : this.amountInMl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterRecordEntryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('amountInMl: $amountInMl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, amountInMl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterRecordEntryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.amountInMl == this.amountInMl);
}

class WaterRecordEntryCompanion extends UpdateCompanion<WaterRecordEntryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<double> amountInMl;
  const WaterRecordEntryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.amountInMl = const Value.absent(),
  });
  WaterRecordEntryCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required double amountInMl,
  }) : amountInMl = Value(amountInMl);
  static Insertable<WaterRecordEntryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<double>? amountInMl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (amountInMl != null) 'amount_in_ml': amountInMl,
    });
  }

  WaterRecordEntryCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<double>? amountInMl,
  }) {
    return WaterRecordEntryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      amountInMl: amountInMl ?? this.amountInMl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (amountInMl.present) {
      map['amount_in_ml'] = Variable<double>(amountInMl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterRecordEntryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('amountInMl: $amountInMl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FoodRecordEntryTable foodRecordEntry = $FoodRecordEntryTable(
    this,
  );
  late final $WaterRecordEntryTable waterRecordEntry = $WaterRecordEntryTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    foodRecordEntry,
    waterRecordEntry,
  ];
}

typedef $$FoodRecordEntryTableCreateCompanionBuilder =
    FoodRecordEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String name,
      required double caloriesPerPortion,
      required double portionSize,
      required double carbs,
      required double protein,
      required double fat,
    });
typedef $$FoodRecordEntryTableUpdateCompanionBuilder =
    FoodRecordEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> name,
      Value<double> caloriesPerPortion,
      Value<double> portionSize,
      Value<double> carbs,
      Value<double> protein,
      Value<double> fat,
    });

class $$FoodRecordEntryTableFilterComposer
    extends Composer<_$AppDatabase, $FoodRecordEntryTable> {
  $$FoodRecordEntryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caloriesPerPortion => $composableBuilder(
    column: $table.caloriesPerPortion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get portionSize => $composableBuilder(
    column: $table.portionSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FoodRecordEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodRecordEntryTable> {
  $$FoodRecordEntryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caloriesPerPortion => $composableBuilder(
    column: $table.caloriesPerPortion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get portionSize => $composableBuilder(
    column: $table.portionSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodRecordEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodRecordEntryTable> {
  $$FoodRecordEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get caloriesPerPortion => $composableBuilder(
    column: $table.caloriesPerPortion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get portionSize => $composableBuilder(
    column: $table.portionSize,
    builder: (column) => column,
  );

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);
}

class $$FoodRecordEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodRecordEntryTable,
          FoodRecordEntryData,
          $$FoodRecordEntryTableFilterComposer,
          $$FoodRecordEntryTableOrderingComposer,
          $$FoodRecordEntryTableAnnotationComposer,
          $$FoodRecordEntryTableCreateCompanionBuilder,
          $$FoodRecordEntryTableUpdateCompanionBuilder,
          (
            FoodRecordEntryData,
            BaseReferences<
              _$AppDatabase,
              $FoodRecordEntryTable,
              FoodRecordEntryData
            >,
          ),
          FoodRecordEntryData,
          PrefetchHooks Function()
        > {
  $$FoodRecordEntryTableTableManager(
    _$AppDatabase db,
    $FoodRecordEntryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$FoodRecordEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FoodRecordEntryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FoodRecordEntryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> caloriesPerPortion = const Value.absent(),
                Value<double> portionSize = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
              }) => FoodRecordEntryCompanion(
                id: id,
                createdAt: createdAt,
                name: name,
                caloriesPerPortion: caloriesPerPortion,
                portionSize: portionSize,
                carbs: carbs,
                protein: protein,
                fat: fat,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String name,
                required double caloriesPerPortion,
                required double portionSize,
                required double carbs,
                required double protein,
                required double fat,
              }) => FoodRecordEntryCompanion.insert(
                id: id,
                createdAt: createdAt,
                name: name,
                caloriesPerPortion: caloriesPerPortion,
                portionSize: portionSize,
                carbs: carbs,
                protein: protein,
                fat: fat,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodRecordEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodRecordEntryTable,
      FoodRecordEntryData,
      $$FoodRecordEntryTableFilterComposer,
      $$FoodRecordEntryTableOrderingComposer,
      $$FoodRecordEntryTableAnnotationComposer,
      $$FoodRecordEntryTableCreateCompanionBuilder,
      $$FoodRecordEntryTableUpdateCompanionBuilder,
      (
        FoodRecordEntryData,
        BaseReferences<
          _$AppDatabase,
          $FoodRecordEntryTable,
          FoodRecordEntryData
        >,
      ),
      FoodRecordEntryData,
      PrefetchHooks Function()
    >;
typedef $$WaterRecordEntryTableCreateCompanionBuilder =
    WaterRecordEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required double amountInMl,
    });
typedef $$WaterRecordEntryTableUpdateCompanionBuilder =
    WaterRecordEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<double> amountInMl,
    });

class $$WaterRecordEntryTableFilterComposer
    extends Composer<_$AppDatabase, $WaterRecordEntryTable> {
  $$WaterRecordEntryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountInMl => $composableBuilder(
    column: $table.amountInMl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaterRecordEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterRecordEntryTable> {
  $$WaterRecordEntryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountInMl => $composableBuilder(
    column: $table.amountInMl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaterRecordEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterRecordEntryTable> {
  $$WaterRecordEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get amountInMl => $composableBuilder(
    column: $table.amountInMl,
    builder: (column) => column,
  );
}

class $$WaterRecordEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaterRecordEntryTable,
          WaterRecordEntryData,
          $$WaterRecordEntryTableFilterComposer,
          $$WaterRecordEntryTableOrderingComposer,
          $$WaterRecordEntryTableAnnotationComposer,
          $$WaterRecordEntryTableCreateCompanionBuilder,
          $$WaterRecordEntryTableUpdateCompanionBuilder,
          (
            WaterRecordEntryData,
            BaseReferences<
              _$AppDatabase,
              $WaterRecordEntryTable,
              WaterRecordEntryData
            >,
          ),
          WaterRecordEntryData,
          PrefetchHooks Function()
        > {
  $$WaterRecordEntryTableTableManager(
    _$AppDatabase db,
    $WaterRecordEntryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$WaterRecordEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$WaterRecordEntryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$WaterRecordEntryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<double> amountInMl = const Value.absent(),
              }) => WaterRecordEntryCompanion(
                id: id,
                createdAt: createdAt,
                amountInMl: amountInMl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required double amountInMl,
              }) => WaterRecordEntryCompanion.insert(
                id: id,
                createdAt: createdAt,
                amountInMl: amountInMl,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaterRecordEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaterRecordEntryTable,
      WaterRecordEntryData,
      $$WaterRecordEntryTableFilterComposer,
      $$WaterRecordEntryTableOrderingComposer,
      $$WaterRecordEntryTableAnnotationComposer,
      $$WaterRecordEntryTableCreateCompanionBuilder,
      $$WaterRecordEntryTableUpdateCompanionBuilder,
      (
        WaterRecordEntryData,
        BaseReferences<
          _$AppDatabase,
          $WaterRecordEntryTable,
          WaterRecordEntryData
        >,
      ),
      WaterRecordEntryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FoodRecordEntryTableTableManager get foodRecordEntry =>
      $$FoodRecordEntryTableTableManager(_db, _db.foodRecordEntry);
  $$WaterRecordEntryTableTableManager get waterRecordEntry =>
      $$WaterRecordEntryTableTableManager(_db, _db.waterRecordEntry);
}
