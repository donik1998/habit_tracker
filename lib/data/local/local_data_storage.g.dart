// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_data_storage.dart';

// ignore_for_file: type=lint
class $ChallengesTable extends Challenges
    with TableInfo<$ChallengesTable, Challenge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChallengesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconPathMeta =
      const VerificationMeta('iconPath');
  @override
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
      'icon_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationInDaysMeta =
      const VerificationMeta('durationInDays');
  @override
  late final GeneratedColumn<int> durationInDays = GeneratedColumn<int>(
      'duration_in_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cacheTimestampMeta =
      const VerificationMeta('cacheTimestamp');
  @override
  late final GeneratedColumn<DateTime> cacheTimestamp =
      GeneratedColumn<DateTime>('cache_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        iconPath,
        durationInDays,
        isCompleted,
        startDate,
        endDate,
        cacheTimestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'challenges';
  @override
  VerificationContext validateIntegrity(Insertable<Challenge> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_path')) {
      context.handle(_iconPathMeta,
          iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta));
    } else if (isInserting) {
      context.missing(_iconPathMeta);
    }
    if (data.containsKey('duration_in_days')) {
      context.handle(
          _durationInDaysMeta,
          durationInDays.isAcceptableOrUnknown(
              data['duration_in_days']!, _durationInDaysMeta));
    } else if (isInserting) {
      context.missing(_durationInDaysMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('cache_timestamp')) {
      context.handle(
          _cacheTimestampMeta,
          cacheTimestamp.isAcceptableOrUnknown(
              data['cache_timestamp']!, _cacheTimestampMeta));
    } else if (isInserting) {
      context.missing(_cacheTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Challenge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Challenge(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      iconPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_path'])!,
      durationInDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_in_days'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      cacheTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cache_timestamp'])!,
    );
  }

  @override
  $ChallengesTable createAlias(String alias) {
    return $ChallengesTable(attachedDatabase, alias);
  }
}

class Challenge extends DataClass implements Insertable<Challenge> {
  final int id;
  final String name;
  final String iconPath;
  final int durationInDays;
  final bool isCompleted;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime cacheTimestamp;
  const Challenge(
      {required this.id,
      required this.name,
      required this.iconPath,
      required this.durationInDays,
      required this.isCompleted,
      required this.startDate,
      required this.endDate,
      required this.cacheTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_path'] = Variable<String>(iconPath);
    map['duration_in_days'] = Variable<int>(durationInDays);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp);
    return map;
  }

  ChallengesCompanion toCompanion(bool nullToAbsent) {
    return ChallengesCompanion(
      id: Value(id),
      name: Value(name),
      iconPath: Value(iconPath),
      durationInDays: Value(durationInDays),
      isCompleted: Value(isCompleted),
      startDate: Value(startDate),
      endDate: Value(endDate),
      cacheTimestamp: Value(cacheTimestamp),
    );
  }

  factory Challenge.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Challenge(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconPath: serializer.fromJson<String>(json['iconPath']),
      durationInDays: serializer.fromJson<int>(json['durationInDays']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      cacheTimestamp: serializer.fromJson<DateTime>(json['cacheTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconPath': serializer.toJson<String>(iconPath),
      'durationInDays': serializer.toJson<int>(durationInDays),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'cacheTimestamp': serializer.toJson<DateTime>(cacheTimestamp),
    };
  }

  Challenge copyWith(
          {int? id,
          String? name,
          String? iconPath,
          int? durationInDays,
          bool? isCompleted,
          DateTime? startDate,
          DateTime? endDate,
          DateTime? cacheTimestamp}) =>
      Challenge(
        id: id ?? this.id,
        name: name ?? this.name,
        iconPath: iconPath ?? this.iconPath,
        durationInDays: durationInDays ?? this.durationInDays,
        isCompleted: isCompleted ?? this.isCompleted,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
      );
  Challenge copyWithCompanion(ChallengesCompanion data) {
    return Challenge(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconPath: data.iconPath.present ? data.iconPath.value : this.iconPath,
      durationInDays: data.durationInDays.present
          ? data.durationInDays.value
          : this.durationInDays,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      cacheTimestamp: data.cacheTimestamp.present
          ? data.cacheTimestamp.value
          : this.cacheTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Challenge(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('durationInDays: $durationInDays, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconPath, durationInDays,
      isCompleted, startDate, endDate, cacheTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Challenge &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconPath == this.iconPath &&
          other.durationInDays == this.durationInDays &&
          other.isCompleted == this.isCompleted &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.cacheTimestamp == this.cacheTimestamp);
}

class ChallengesCompanion extends UpdateCompanion<Challenge> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconPath;
  final Value<int> durationInDays;
  final Value<bool> isCompleted;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<DateTime> cacheTimestamp;
  const ChallengesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.durationInDays = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.cacheTimestamp = const Value.absent(),
  });
  ChallengesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String iconPath,
    required int durationInDays,
    this.isCompleted = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    required DateTime cacheTimestamp,
  })  : name = Value(name),
        iconPath = Value(iconPath),
        durationInDays = Value(durationInDays),
        startDate = Value(startDate),
        endDate = Value(endDate),
        cacheTimestamp = Value(cacheTimestamp);
  static Insertable<Challenge> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? iconPath,
    Expression<int>? durationInDays,
    Expression<bool>? isCompleted,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? cacheTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconPath != null) 'icon_path': iconPath,
      if (durationInDays != null) 'duration_in_days': durationInDays,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (cacheTimestamp != null) 'cache_timestamp': cacheTimestamp,
    });
  }

  ChallengesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? iconPath,
      Value<int>? durationInDays,
      Value<bool>? isCompleted,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<DateTime>? cacheTimestamp}) {
    return ChallengesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      durationInDays: durationInDays ?? this.durationInDays,
      isCompleted: isCompleted ?? this.isCompleted,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (durationInDays.present) {
      map['duration_in_days'] = Variable<int>(durationInDays.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (cacheTimestamp.present) {
      map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChallengesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('durationInDays: $durationInDays, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }
}

class $GoalsGroupTable extends GoalsGroup
    with TableInfo<$GoalsGroupTable, GoalsGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsGroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconPathMeta =
      const VerificationMeta('iconPath');
  @override
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
      'icon_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cacheTimestampMeta =
      const VerificationMeta('cacheTimestamp');
  @override
  late final GeneratedColumn<DateTime> cacheTimestamp =
      GeneratedColumn<DateTime>('cache_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, iconPath, cacheTimestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals_group';
  @override
  VerificationContext validateIntegrity(Insertable<GoalsGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_path')) {
      context.handle(_iconPathMeta,
          iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta));
    } else if (isInserting) {
      context.missing(_iconPathMeta);
    }
    if (data.containsKey('cache_timestamp')) {
      context.handle(
          _cacheTimestampMeta,
          cacheTimestamp.isAcceptableOrUnknown(
              data['cache_timestamp']!, _cacheTimestampMeta));
    } else if (isInserting) {
      context.missing(_cacheTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalsGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalsGroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      iconPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_path'])!,
      cacheTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cache_timestamp'])!,
    );
  }

  @override
  $GoalsGroupTable createAlias(String alias) {
    return $GoalsGroupTable(attachedDatabase, alias);
  }
}

class GoalsGroupData extends DataClass implements Insertable<GoalsGroupData> {
  final int id;
  final String name;
  final String iconPath;
  final DateTime cacheTimestamp;
  const GoalsGroupData(
      {required this.id,
      required this.name,
      required this.iconPath,
      required this.cacheTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_path'] = Variable<String>(iconPath);
    map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp);
    return map;
  }

  GoalsGroupCompanion toCompanion(bool nullToAbsent) {
    return GoalsGroupCompanion(
      id: Value(id),
      name: Value(name),
      iconPath: Value(iconPath),
      cacheTimestamp: Value(cacheTimestamp),
    );
  }

  factory GoalsGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalsGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconPath: serializer.fromJson<String>(json['iconPath']),
      cacheTimestamp: serializer.fromJson<DateTime>(json['cacheTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconPath': serializer.toJson<String>(iconPath),
      'cacheTimestamp': serializer.toJson<DateTime>(cacheTimestamp),
    };
  }

  GoalsGroupData copyWith(
          {int? id,
          String? name,
          String? iconPath,
          DateTime? cacheTimestamp}) =>
      GoalsGroupData(
        id: id ?? this.id,
        name: name ?? this.name,
        iconPath: iconPath ?? this.iconPath,
        cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
      );
  GoalsGroupData copyWithCompanion(GoalsGroupCompanion data) {
    return GoalsGroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconPath: data.iconPath.present ? data.iconPath.value : this.iconPath,
      cacheTimestamp: data.cacheTimestamp.present
          ? data.cacheTimestamp.value
          : this.cacheTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalsGroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconPath, cacheTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalsGroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconPath == this.iconPath &&
          other.cacheTimestamp == this.cacheTimestamp);
}

class GoalsGroupCompanion extends UpdateCompanion<GoalsGroupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconPath;
  final Value<DateTime> cacheTimestamp;
  const GoalsGroupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.cacheTimestamp = const Value.absent(),
  });
  GoalsGroupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String iconPath,
    required DateTime cacheTimestamp,
  })  : name = Value(name),
        iconPath = Value(iconPath),
        cacheTimestamp = Value(cacheTimestamp);
  static Insertable<GoalsGroupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? iconPath,
    Expression<DateTime>? cacheTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconPath != null) 'icon_path': iconPath,
      if (cacheTimestamp != null) 'cache_timestamp': cacheTimestamp,
    });
  }

  GoalsGroupCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? iconPath,
      Value<DateTime>? cacheTimestamp}) {
    return GoalsGroupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (cacheTimestamp.present) {
      map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsGroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES goals_group (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cacheTimestampMeta =
      const VerificationMeta('cacheTimestamp');
  @override
  late final GeneratedColumn<DateTime> cacheTimestamp =
      GeneratedColumn<DateTime>('cache_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, groupId, description, cacheTimestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cache_timestamp')) {
      context.handle(
          _cacheTimestampMeta,
          cacheTimestamp.isAcceptableOrUnknown(
              data['cache_timestamp']!, _cacheTimestampMeta));
    } else if (isInserting) {
      context.missing(_cacheTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      cacheTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cache_timestamp'])!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final int groupId;
  final String description;
  final DateTime cacheTimestamp;
  const Goal(
      {required this.id,
      required this.groupId,
      required this.description,
      required this.cacheTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group_id'] = Variable<int>(groupId);
    map['description'] = Variable<String>(description);
    map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      groupId: Value(groupId),
      description: Value(description),
      cacheTimestamp: Value(cacheTimestamp),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<int>(json['groupId']),
      description: serializer.fromJson<String>(json['description']),
      cacheTimestamp: serializer.fromJson<DateTime>(json['cacheTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<int>(groupId),
      'description': serializer.toJson<String>(description),
      'cacheTimestamp': serializer.toJson<DateTime>(cacheTimestamp),
    };
  }

  Goal copyWith(
          {int? id,
          int? groupId,
          String? description,
          DateTime? cacheTimestamp}) =>
      Goal(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        description: description ?? this.description,
        cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
      );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      description:
          data.description.present ? data.description.value : this.description,
      cacheTimestamp: data.cacheTimestamp.present
          ? data.cacheTimestamp.value
          : this.cacheTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('description: $description, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groupId, description, cacheTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.description == this.description &&
          other.cacheTimestamp == this.cacheTimestamp);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<int> groupId;
  final Value<String> description;
  final Value<DateTime> cacheTimestamp;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.description = const Value.absent(),
    this.cacheTimestamp = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    required int groupId,
    required String description,
    required DateTime cacheTimestamp,
  })  : groupId = Value(groupId),
        description = Value(description),
        cacheTimestamp = Value(cacheTimestamp);
  static Insertable<Goal> custom({
    Expression<int>? id,
    Expression<int>? groupId,
    Expression<String>? description,
    Expression<DateTime>? cacheTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (description != null) 'description': description,
      if (cacheTimestamp != null) 'cache_timestamp': cacheTimestamp,
    });
  }

  GoalsCompanion copyWith(
      {Value<int>? id,
      Value<int>? groupId,
      Value<String>? description,
      Value<DateTime>? cacheTimestamp}) {
    return GoalsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      description: description ?? this.description,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cacheTimestamp.present) {
      map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('description: $description, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _challengeIdMeta =
      const VerificationMeta('challengeId');
  @override
  late final GeneratedColumn<int> challengeId = GeneratedColumn<int>(
      'challenge_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES challenges (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconPathMeta =
      const VerificationMeta('iconPath');
  @override
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
      'icon_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cacheTimestampMeta =
      const VerificationMeta('cacheTimestamp');
  @override
  late final GeneratedColumn<DateTime> cacheTimestamp =
      GeneratedColumn<DateTime>('cache_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        challengeId,
        name,
        iconPath,
        isCompleted,
        colorHex,
        description,
        startDate,
        cacheTimestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('challenge_id')) {
      context.handle(
          _challengeIdMeta,
          challengeId.isAcceptableOrUnknown(
              data['challenge_id']!, _challengeIdMeta));
    } else if (isInserting) {
      context.missing(_challengeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_path')) {
      context.handle(_iconPathMeta,
          iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta));
    } else if (isInserting) {
      context.missing(_iconPathMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('cache_timestamp')) {
      context.handle(
          _cacheTimestampMeta,
          cacheTimestamp.isAcceptableOrUnknown(
              data['cache_timestamp']!, _cacheTimestampMeta));
    } else if (isInserting) {
      context.missing(_cacheTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      challengeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}challenge_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      iconPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_path'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      cacheTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cache_timestamp'])!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final int challengeId;
  final String name;
  final String iconPath;
  final bool isCompleted;
  final String colorHex;
  final String description;
  final DateTime startDate;
  final DateTime cacheTimestamp;
  const Habit(
      {required this.id,
      required this.challengeId,
      required this.name,
      required this.iconPath,
      required this.isCompleted,
      required this.colorHex,
      required this.description,
      required this.startDate,
      required this.cacheTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['challenge_id'] = Variable<int>(challengeId);
    map['name'] = Variable<String>(name);
    map['icon_path'] = Variable<String>(iconPath);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['color_hex'] = Variable<String>(colorHex);
    map['description'] = Variable<String>(description);
    map['start_date'] = Variable<DateTime>(startDate);
    map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      challengeId: Value(challengeId),
      name: Value(name),
      iconPath: Value(iconPath),
      isCompleted: Value(isCompleted),
      colorHex: Value(colorHex),
      description: Value(description),
      startDate: Value(startDate),
      cacheTimestamp: Value(cacheTimestamp),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      challengeId: serializer.fromJson<int>(json['challengeId']),
      name: serializer.fromJson<String>(json['name']),
      iconPath: serializer.fromJson<String>(json['iconPath']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      cacheTimestamp: serializer.fromJson<DateTime>(json['cacheTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'challengeId': serializer.toJson<int>(challengeId),
      'name': serializer.toJson<String>(name),
      'iconPath': serializer.toJson<String>(iconPath),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'colorHex': serializer.toJson<String>(colorHex),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<DateTime>(startDate),
      'cacheTimestamp': serializer.toJson<DateTime>(cacheTimestamp),
    };
  }

  Habit copyWith(
          {int? id,
          int? challengeId,
          String? name,
          String? iconPath,
          bool? isCompleted,
          String? colorHex,
          String? description,
          DateTime? startDate,
          DateTime? cacheTimestamp}) =>
      Habit(
        id: id ?? this.id,
        challengeId: challengeId ?? this.challengeId,
        name: name ?? this.name,
        iconPath: iconPath ?? this.iconPath,
        isCompleted: isCompleted ?? this.isCompleted,
        colorHex: colorHex ?? this.colorHex,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      challengeId:
          data.challengeId.present ? data.challengeId.value : this.challengeId,
      name: data.name.present ? data.name.value : this.name,
      iconPath: data.iconPath.present ? data.iconPath.value : this.iconPath,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      description:
          data.description.present ? data.description.value : this.description,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      cacheTimestamp: data.cacheTimestamp.present
          ? data.cacheTimestamp.value
          : this.cacheTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('challengeId: $challengeId, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('colorHex: $colorHex, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, challengeId, name, iconPath, isCompleted,
      colorHex, description, startDate, cacheTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.challengeId == this.challengeId &&
          other.name == this.name &&
          other.iconPath == this.iconPath &&
          other.isCompleted == this.isCompleted &&
          other.colorHex == this.colorHex &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.cacheTimestamp == this.cacheTimestamp);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<int> challengeId;
  final Value<String> name;
  final Value<String> iconPath;
  final Value<bool> isCompleted;
  final Value<String> colorHex;
  final Value<String> description;
  final Value<DateTime> startDate;
  final Value<DateTime> cacheTimestamp;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.challengeId = const Value.absent(),
    this.name = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.cacheTimestamp = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required int challengeId,
    required String name,
    required String iconPath,
    this.isCompleted = const Value.absent(),
    required String colorHex,
    required String description,
    required DateTime startDate,
    required DateTime cacheTimestamp,
  })  : challengeId = Value(challengeId),
        name = Value(name),
        iconPath = Value(iconPath),
        colorHex = Value(colorHex),
        description = Value(description),
        startDate = Value(startDate),
        cacheTimestamp = Value(cacheTimestamp);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<int>? challengeId,
    Expression<String>? name,
    Expression<String>? iconPath,
    Expression<bool>? isCompleted,
    Expression<String>? colorHex,
    Expression<String>? description,
    Expression<DateTime>? startDate,
    Expression<DateTime>? cacheTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (challengeId != null) 'challenge_id': challengeId,
      if (name != null) 'name': name,
      if (iconPath != null) 'icon_path': iconPath,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (colorHex != null) 'color_hex': colorHex,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (cacheTimestamp != null) 'cache_timestamp': cacheTimestamp,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? challengeId,
      Value<String>? name,
      Value<String>? iconPath,
      Value<bool>? isCompleted,
      Value<String>? colorHex,
      Value<String>? description,
      Value<DateTime>? startDate,
      Value<DateTime>? cacheTimestamp}) {
    return HabitsCompanion(
      id: id ?? this.id,
      challengeId: challengeId ?? this.challengeId,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      isCompleted: isCompleted ?? this.isCompleted,
      colorHex: colorHex ?? this.colorHex,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (challengeId.present) {
      map['challenge_id'] = Variable<int>(challengeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (cacheTimestamp.present) {
      map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('challengeId: $challengeId, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('colorHex: $colorHex, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }
}

class $HabitRecordsTable extends HabitRecords
    with TableInfo<$HabitRecordsTable, HabitRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int> habitId = GeneratedColumn<int>(
      'habit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES habits (id)'));
  static const VerificationMeta _dayCountMeta =
      const VerificationMeta('dayCount');
  @override
  late final GeneratedColumn<int> dayCount = GeneratedColumn<int>(
      'day_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cacheTimestampMeta =
      const VerificationMeta('cacheTimestamp');
  @override
  late final GeneratedColumn<DateTime> cacheTimestamp =
      GeneratedColumn<DateTime>('cache_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, habitId, dayCount, progress, date, cacheTimestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_records';
  @override
  VerificationContext validateIntegrity(Insertable<HabitRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('day_count')) {
      context.handle(_dayCountMeta,
          dayCount.isAcceptableOrUnknown(data['day_count']!, _dayCountMeta));
    } else if (isInserting) {
      context.missing(_dayCountMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('cache_timestamp')) {
      context.handle(
          _cacheTimestampMeta,
          cacheTimestamp.isAcceptableOrUnknown(
              data['cache_timestamp']!, _cacheTimestampMeta));
    } else if (isInserting) {
      context.missing(_cacheTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit_id'])!,
      dayCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_count'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      cacheTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cache_timestamp'])!,
    );
  }

  @override
  $HabitRecordsTable createAlias(String alias) {
    return $HabitRecordsTable(attachedDatabase, alias);
  }
}

class HabitRecord extends DataClass implements Insertable<HabitRecord> {
  final int id;
  final int habitId;
  final int dayCount;
  final double progress;
  final DateTime date;
  final DateTime cacheTimestamp;
  const HabitRecord(
      {required this.id,
      required this.habitId,
      required this.dayCount,
      required this.progress,
      required this.date,
      required this.cacheTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    map['day_count'] = Variable<int>(dayCount);
    map['progress'] = Variable<double>(progress);
    map['date'] = Variable<DateTime>(date);
    map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp);
    return map;
  }

  HabitRecordsCompanion toCompanion(bool nullToAbsent) {
    return HabitRecordsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      dayCount: Value(dayCount),
      progress: Value(progress),
      date: Value(date),
      cacheTimestamp: Value(cacheTimestamp),
    );
  }

  factory HabitRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitRecord(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      dayCount: serializer.fromJson<int>(json['dayCount']),
      progress: serializer.fromJson<double>(json['progress']),
      date: serializer.fromJson<DateTime>(json['date']),
      cacheTimestamp: serializer.fromJson<DateTime>(json['cacheTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'dayCount': serializer.toJson<int>(dayCount),
      'progress': serializer.toJson<double>(progress),
      'date': serializer.toJson<DateTime>(date),
      'cacheTimestamp': serializer.toJson<DateTime>(cacheTimestamp),
    };
  }

  HabitRecord copyWith(
          {int? id,
          int? habitId,
          int? dayCount,
          double? progress,
          DateTime? date,
          DateTime? cacheTimestamp}) =>
      HabitRecord(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        dayCount: dayCount ?? this.dayCount,
        progress: progress ?? this.progress,
        date: date ?? this.date,
        cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
      );
  HabitRecord copyWithCompanion(HabitRecordsCompanion data) {
    return HabitRecord(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      dayCount: data.dayCount.present ? data.dayCount.value : this.dayCount,
      progress: data.progress.present ? data.progress.value : this.progress,
      date: data.date.present ? data.date.value : this.date,
      cacheTimestamp: data.cacheTimestamp.present
          ? data.cacheTimestamp.value
          : this.cacheTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitRecord(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('dayCount: $dayCount, ')
          ..write('progress: $progress, ')
          ..write('date: $date, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitId, dayCount, progress, date, cacheTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitRecord &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.dayCount == this.dayCount &&
          other.progress == this.progress &&
          other.date == this.date &&
          other.cacheTimestamp == this.cacheTimestamp);
}

class HabitRecordsCompanion extends UpdateCompanion<HabitRecord> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<int> dayCount;
  final Value<double> progress;
  final Value<DateTime> date;
  final Value<DateTime> cacheTimestamp;
  const HabitRecordsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.dayCount = const Value.absent(),
    this.progress = const Value.absent(),
    this.date = const Value.absent(),
    this.cacheTimestamp = const Value.absent(),
  });
  HabitRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    required int dayCount,
    required double progress,
    required DateTime date,
    required DateTime cacheTimestamp,
  })  : habitId = Value(habitId),
        dayCount = Value(dayCount),
        progress = Value(progress),
        date = Value(date),
        cacheTimestamp = Value(cacheTimestamp);
  static Insertable<HabitRecord> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<int>? dayCount,
    Expression<double>? progress,
    Expression<DateTime>? date,
    Expression<DateTime>? cacheTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (dayCount != null) 'day_count': dayCount,
      if (progress != null) 'progress': progress,
      if (date != null) 'date': date,
      if (cacheTimestamp != null) 'cache_timestamp': cacheTimestamp,
    });
  }

  HabitRecordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? habitId,
      Value<int>? dayCount,
      Value<double>? progress,
      Value<DateTime>? date,
      Value<DateTime>? cacheTimestamp}) {
    return HabitRecordsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      dayCount: dayCount ?? this.dayCount,
      progress: progress ?? this.progress,
      date: date ?? this.date,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (dayCount.present) {
      map['day_count'] = Variable<int>(dayCount.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (cacheTimestamp.present) {
      map['cache_timestamp'] = Variable<DateTime>(cacheTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitRecordsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('dayCount: $dayCount, ')
          ..write('progress: $progress, ')
          ..write('date: $date, ')
          ..write('cacheTimestamp: $cacheTimestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $ChallengesTable challenges = $ChallengesTable(this);
  late final $GoalsGroupTable goalsGroup = $GoalsGroupTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitRecordsTable habitRecords = $HabitRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [challenges, goalsGroup, goals, habits, habitRecords];
}

typedef $$ChallengesTableCreateCompanionBuilder = ChallengesCompanion Function({
  Value<int> id,
  required String name,
  required String iconPath,
  required int durationInDays,
  Value<bool> isCompleted,
  required DateTime startDate,
  required DateTime endDate,
  required DateTime cacheTimestamp,
});
typedef $$ChallengesTableUpdateCompanionBuilder = ChallengesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> iconPath,
  Value<int> durationInDays,
  Value<bool> isCompleted,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<DateTime> cacheTimestamp,
});

final class $$ChallengesTableReferences
    extends BaseReferences<_$LocalDatabase, $ChallengesTable, Challenge> {
  $$ChallengesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HabitsTable, List<Habit>> _habitsRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.habits,
          aliasName:
              $_aliasNameGenerator(db.challenges.id, db.habits.challengeId));

  $$HabitsTableProcessedTableManager get habitsRefs {
    final manager = $$HabitsTableTableManager($_db, $_db.habits)
        .filter((f) => f.challengeId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_habitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ChallengesTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $ChallengesTable> {
  $$ChallengesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get durationInDays => $state.composableBuilder(
      column: $state.table.durationInDays,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter habitsRefs(
      ComposableFilter Function($$HabitsTableFilterComposer f) f) {
    final $$HabitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.habits,
        getReferencedColumn: (t) => t.challengeId,
        builder: (joinBuilder, parentComposers) => $$HabitsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.habits, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChallengesTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $ChallengesTable> {
  $$ChallengesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get durationInDays => $state.composableBuilder(
      column: $state.table.durationInDays,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ChallengesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ChallengesTable,
    Challenge,
    $$ChallengesTableFilterComposer,
    $$ChallengesTableOrderingComposer,
    $$ChallengesTableCreateCompanionBuilder,
    $$ChallengesTableUpdateCompanionBuilder,
    (Challenge, $$ChallengesTableReferences),
    Challenge,
    PrefetchHooks Function({bool habitsRefs})> {
  $$ChallengesTableTableManager(_$LocalDatabase db, $ChallengesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChallengesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChallengesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> iconPath = const Value.absent(),
            Value<int> durationInDays = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<DateTime> cacheTimestamp = const Value.absent(),
          }) =>
              ChallengesCompanion(
            id: id,
            name: name,
            iconPath: iconPath,
            durationInDays: durationInDays,
            isCompleted: isCompleted,
            startDate: startDate,
            endDate: endDate,
            cacheTimestamp: cacheTimestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String iconPath,
            required int durationInDays,
            Value<bool> isCompleted = const Value.absent(),
            required DateTime startDate,
            required DateTime endDate,
            required DateTime cacheTimestamp,
          }) =>
              ChallengesCompanion.insert(
            id: id,
            name: name,
            iconPath: iconPath,
            durationInDays: durationInDays,
            isCompleted: isCompleted,
            startDate: startDate,
            endDate: endDate,
            cacheTimestamp: cacheTimestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ChallengesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (habitsRefs) db.habits],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ChallengesTableReferences._habitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ChallengesTableReferences(db, table, p0)
                                .habitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.challengeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ChallengesTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $ChallengesTable,
    Challenge,
    $$ChallengesTableFilterComposer,
    $$ChallengesTableOrderingComposer,
    $$ChallengesTableCreateCompanionBuilder,
    $$ChallengesTableUpdateCompanionBuilder,
    (Challenge, $$ChallengesTableReferences),
    Challenge,
    PrefetchHooks Function({bool habitsRefs})>;
typedef $$GoalsGroupTableCreateCompanionBuilder = GoalsGroupCompanion Function({
  Value<int> id,
  required String name,
  required String iconPath,
  required DateTime cacheTimestamp,
});
typedef $$GoalsGroupTableUpdateCompanionBuilder = GoalsGroupCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> iconPath,
  Value<DateTime> cacheTimestamp,
});

final class $$GoalsGroupTableReferences
    extends BaseReferences<_$LocalDatabase, $GoalsGroupTable, GoalsGroupData> {
  $$GoalsGroupTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.goals,
          aliasName: $_aliasNameGenerator(db.goalsGroup.id, db.goals.groupId));

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.groupId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GoalsGroupTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $GoalsGroupTable> {
  $$GoalsGroupTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter goalsRefs(
      ComposableFilter Function($$GoalsTableFilterComposer f) f) {
    final $$GoalsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.goals,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder, parentComposers) => $$GoalsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.goals, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GoalsGroupTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $GoalsGroupTable> {
  $$GoalsGroupTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$GoalsGroupTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $GoalsGroupTable,
    GoalsGroupData,
    $$GoalsGroupTableFilterComposer,
    $$GoalsGroupTableOrderingComposer,
    $$GoalsGroupTableCreateCompanionBuilder,
    $$GoalsGroupTableUpdateCompanionBuilder,
    (GoalsGroupData, $$GoalsGroupTableReferences),
    GoalsGroupData,
    PrefetchHooks Function({bool goalsRefs})> {
  $$GoalsGroupTableTableManager(_$LocalDatabase db, $GoalsGroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GoalsGroupTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GoalsGroupTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> iconPath = const Value.absent(),
            Value<DateTime> cacheTimestamp = const Value.absent(),
          }) =>
              GoalsGroupCompanion(
            id: id,
            name: name,
            iconPath: iconPath,
            cacheTimestamp: cacheTimestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String iconPath,
            required DateTime cacheTimestamp,
          }) =>
              GoalsGroupCompanion.insert(
            id: id,
            name: name,
            iconPath: iconPath,
            cacheTimestamp: cacheTimestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GoalsGroupTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({goalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalsRefs) db.goals],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GoalsGroupTableReferences._goalsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GoalsGroupTableReferences(db, table, p0)
                                .goalsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.groupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GoalsGroupTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $GoalsGroupTable,
    GoalsGroupData,
    $$GoalsGroupTableFilterComposer,
    $$GoalsGroupTableOrderingComposer,
    $$GoalsGroupTableCreateCompanionBuilder,
    $$GoalsGroupTableUpdateCompanionBuilder,
    (GoalsGroupData, $$GoalsGroupTableReferences),
    GoalsGroupData,
    PrefetchHooks Function({bool goalsRefs})>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  Value<int> id,
  required int groupId,
  required String description,
  required DateTime cacheTimestamp,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<int> id,
  Value<int> groupId,
  Value<String> description,
  Value<DateTime> cacheTimestamp,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$LocalDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsGroupTable _groupIdTable(_$LocalDatabase db) => db.goalsGroup
      .createAlias($_aliasNameGenerator(db.goals.groupId, db.goalsGroup.id));

  $$GoalsGroupTableProcessedTableManager? get groupId {
    if ($_item.groupId == null) return null;
    final manager = $$GoalsGroupTableTableManager($_db, $_db.goalsGroup)
        .filter((f) => f.id($_item.groupId!));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GoalsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$GoalsGroupTableFilterComposer get groupId {
    final $$GoalsGroupTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.goalsGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoalsGroupTableFilterComposer(ComposerState($state.db,
                $state.db.goalsGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$GoalsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$GoalsGroupTableOrderingComposer get groupId {
    final $$GoalsGroupTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.goalsGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoalsGroupTableOrderingComposer(ComposerState($state.db,
                $state.db.goalsGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$GoalsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, $$GoalsTableReferences),
    Goal,
    PrefetchHooks Function({bool groupId})> {
  $$GoalsTableTableManager(_$LocalDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GoalsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GoalsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> groupId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> cacheTimestamp = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            groupId: groupId,
            description: description,
            cacheTimestamp: cacheTimestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int groupId,
            required String description,
            required DateTime cacheTimestamp,
          }) =>
              GoalsCompanion.insert(
            id: id,
            groupId: groupId,
            description: description,
            cacheTimestamp: cacheTimestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GoalsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({groupId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupId,
                    referencedTable: $$GoalsTableReferences._groupIdTable(db),
                    referencedColumn:
                        $$GoalsTableReferences._groupIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, $$GoalsTableReferences),
    Goal,
    PrefetchHooks Function({bool groupId})>;
typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  required int challengeId,
  required String name,
  required String iconPath,
  Value<bool> isCompleted,
  required String colorHex,
  required String description,
  required DateTime startDate,
  required DateTime cacheTimestamp,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<int> challengeId,
  Value<String> name,
  Value<String> iconPath,
  Value<bool> isCompleted,
  Value<String> colorHex,
  Value<String> description,
  Value<DateTime> startDate,
  Value<DateTime> cacheTimestamp,
});

final class $$HabitsTableReferences
    extends BaseReferences<_$LocalDatabase, $HabitsTable, Habit> {
  $$HabitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChallengesTable _challengeIdTable(_$LocalDatabase db) =>
      db.challenges.createAlias(
          $_aliasNameGenerator(db.habits.challengeId, db.challenges.id));

  $$ChallengesTableProcessedTableManager? get challengeId {
    if ($_item.challengeId == null) return null;
    final manager = $$ChallengesTableTableManager($_db, $_db.challenges)
        .filter((f) => f.id($_item.challengeId!));
    final item = $_typedResult.readTableOrNull(_challengeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$HabitRecordsTable, List<HabitRecord>>
      _habitRecordsRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.habitRecords,
              aliasName:
                  $_aliasNameGenerator(db.habits.id, db.habitRecords.habitId));

  $$HabitRecordsTableProcessedTableManager get habitRecordsRefs {
    final manager = $$HabitRecordsTableTableManager($_db, $_db.habitRecords)
        .filter((f) => f.habitId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_habitRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HabitsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get colorHex => $state.composableBuilder(
      column: $state.table.colorHex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChallengesTableFilterComposer get challengeId {
    final $$ChallengesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.challengeId,
        referencedTable: $state.db.challenges,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChallengesTableFilterComposer(ComposerState($state.db,
                $state.db.challenges, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter habitRecordsRefs(
      ComposableFilter Function($$HabitRecordsTableFilterComposer f) f) {
    final $$HabitRecordsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.habitRecords,
        getReferencedColumn: (t) => t.habitId,
        builder: (joinBuilder, parentComposers) =>
            $$HabitRecordsTableFilterComposer(ComposerState($state.db,
                $state.db.habitRecords, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$HabitsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get colorHex => $state.composableBuilder(
      column: $state.table.colorHex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChallengesTableOrderingComposer get challengeId {
    final $$ChallengesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.challengeId,
        referencedTable: $state.db.challenges,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChallengesTableOrderingComposer(ComposerState($state.db,
                $state.db.challenges, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$HabitsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableReferences),
    Habit,
    PrefetchHooks Function({bool challengeId, bool habitRecordsRefs})> {
  $$HabitsTableTableManager(_$LocalDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HabitsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HabitsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> challengeId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> iconPath = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<String> colorHex = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> cacheTimestamp = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            challengeId: challengeId,
            name: name,
            iconPath: iconPath,
            isCompleted: isCompleted,
            colorHex: colorHex,
            description: description,
            startDate: startDate,
            cacheTimestamp: cacheTimestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int challengeId,
            required String name,
            required String iconPath,
            Value<bool> isCompleted = const Value.absent(),
            required String colorHex,
            required String description,
            required DateTime startDate,
            required DateTime cacheTimestamp,
          }) =>
              HabitsCompanion.insert(
            id: id,
            challengeId: challengeId,
            name: name,
            iconPath: iconPath,
            isCompleted: isCompleted,
            colorHex: colorHex,
            description: description,
            startDate: startDate,
            cacheTimestamp: cacheTimestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HabitsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {challengeId = false, habitRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (habitRecordsRefs) db.habitRecords],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (challengeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.challengeId,
                    referencedTable:
                        $$HabitsTableReferences._challengeIdTable(db),
                    referencedColumn:
                        $$HabitsTableReferences._challengeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitRecordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$HabitsTableReferences._habitRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HabitsTableReferences(db, table, p0)
                                .habitRecordsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.habitId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableReferences),
    Habit,
    PrefetchHooks Function({bool challengeId, bool habitRecordsRefs})>;
typedef $$HabitRecordsTableCreateCompanionBuilder = HabitRecordsCompanion
    Function({
  Value<int> id,
  required int habitId,
  required int dayCount,
  required double progress,
  required DateTime date,
  required DateTime cacheTimestamp,
});
typedef $$HabitRecordsTableUpdateCompanionBuilder = HabitRecordsCompanion
    Function({
  Value<int> id,
  Value<int> habitId,
  Value<int> dayCount,
  Value<double> progress,
  Value<DateTime> date,
  Value<DateTime> cacheTimestamp,
});

final class $$HabitRecordsTableReferences
    extends BaseReferences<_$LocalDatabase, $HabitRecordsTable, HabitRecord> {
  $$HabitRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HabitsTable _habitIdTable(_$LocalDatabase db) => db.habits
      .createAlias($_aliasNameGenerator(db.habitRecords.habitId, db.habits.id));

  $$HabitsTableProcessedTableManager? get habitId {
    if ($_item.habitId == null) return null;
    final manager = $$HabitsTableTableManager($_db, $_db.habits)
        .filter((f) => f.id($_item.habitId!));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HabitRecordsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $HabitRecordsTable> {
  $$HabitRecordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dayCount => $state.composableBuilder(
      column: $state.table.dayCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get progress => $state.composableBuilder(
      column: $state.table.progress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$HabitsTableFilterComposer get habitId {
    final $$HabitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $state.db.habits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$HabitsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.habits, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$HabitRecordsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $HabitRecordsTable> {
  $$HabitRecordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dayCount => $state.composableBuilder(
      column: $state.table.dayCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get progress => $state.composableBuilder(
      column: $state.table.progress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get cacheTimestamp => $state.composableBuilder(
      column: $state.table.cacheTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$HabitsTableOrderingComposer get habitId {
    final $$HabitsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $state.db.habits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$HabitsTableOrderingComposer(ComposerState(
                $state.db, $state.db.habits, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$HabitRecordsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $HabitRecordsTable,
    HabitRecord,
    $$HabitRecordsTableFilterComposer,
    $$HabitRecordsTableOrderingComposer,
    $$HabitRecordsTableCreateCompanionBuilder,
    $$HabitRecordsTableUpdateCompanionBuilder,
    (HabitRecord, $$HabitRecordsTableReferences),
    HabitRecord,
    PrefetchHooks Function({bool habitId})> {
  $$HabitRecordsTableTableManager(_$LocalDatabase db, $HabitRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HabitRecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HabitRecordsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> habitId = const Value.absent(),
            Value<int> dayCount = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> cacheTimestamp = const Value.absent(),
          }) =>
              HabitRecordsCompanion(
            id: id,
            habitId: habitId,
            dayCount: dayCount,
            progress: progress,
            date: date,
            cacheTimestamp: cacheTimestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int habitId,
            required int dayCount,
            required double progress,
            required DateTime date,
            required DateTime cacheTimestamp,
          }) =>
              HabitRecordsCompanion.insert(
            id: id,
            habitId: habitId,
            dayCount: dayCount,
            progress: progress,
            date: date,
            cacheTimestamp: cacheTimestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HabitRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (habitId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.habitId,
                    referencedTable:
                        $$HabitRecordsTableReferences._habitIdTable(db),
                    referencedColumn:
                        $$HabitRecordsTableReferences._habitIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HabitRecordsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $HabitRecordsTable,
    HabitRecord,
    $$HabitRecordsTableFilterComposer,
    $$HabitRecordsTableOrderingComposer,
    $$HabitRecordsTableCreateCompanionBuilder,
    $$HabitRecordsTableUpdateCompanionBuilder,
    (HabitRecord, $$HabitRecordsTableReferences),
    HabitRecord,
    PrefetchHooks Function({bool habitId})>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db, _db.challenges);
  $$GoalsGroupTableTableManager get goalsGroup =>
      $$GoalsGroupTableTableManager(_db, _db.goalsGroup);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitRecordsTableTableManager get habitRecords =>
      $$HabitRecordsTableTableManager(_db, _db.habitRecords);
}
