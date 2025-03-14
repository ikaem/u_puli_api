// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_wrapper.dart';

// ignore_for_file: type=lint
class $EventEntityTable extends EventEntity
    with TableInfo<$EventEntityTable, EventEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, date, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_entity';
  @override
  VerificationContext validateIntegrity(Insertable<EventEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {title, date, location},
      ];
  @override
  EventEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
    );
  }

  @override
  $EventEntityTable createAlias(String alias) {
    return $EventEntityTable(attachedDatabase, alias);
  }
}

class EventEntityData extends DataClass implements Insertable<EventEntityData> {
  final int id;
  final String title;
  final DateTime date;
  final String location;
  const EventEntityData(
      {required this.id,
      required this.title,
      required this.date,
      required this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['location'] = Variable<String>(location);
    return map;
  }

  EventEntityCompanion toCompanion(bool nullToAbsent) {
    return EventEntityCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      location: Value(location),
    );
  }

  factory EventEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'location': serializer.toJson<String>(location),
    };
  }

  EventEntityData copyWith(
          {int? id, String? title, DateTime? date, String? location}) =>
      EventEntityData(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        location: location ?? this.location,
      );
  EventEntityData copyWithCompanion(EventEntityCompanion data) {
    return EventEntityData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.location == this.location);
}

class EventEntityCompanion extends UpdateCompanion<EventEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<String> location;
  const EventEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.location = const Value.absent(),
  });
  EventEntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime date,
    required String location,
  })  : title = Value(title),
        date = Value(date),
        location = Value(location);
  static Insertable<EventEntityData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (location != null) 'location': location,
    });
  }

  EventEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? date,
      Value<String>? location}) {
    return EventEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $AuthEntityTable extends AuthEntity
    with TableInfo<$AuthEntityTable, AuthEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_entity';
  @override
  VerificationContext validateIntegrity(Insertable<AuthEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $AuthEntityTable createAlias(String alias) {
    return $AuthEntityTable(attachedDatabase, alias);
  }
}

class AuthEntityData extends DataClass implements Insertable<AuthEntityData> {
  final int id;
  final String email;
  final String password;
  const AuthEntityData(
      {required this.id, required this.email, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  AuthEntityCompanion toCompanion(bool nullToAbsent) {
    return AuthEntityCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
    );
  }

  factory AuthEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthEntityData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  AuthEntityData copyWith({int? id, String? email, String? password}) =>
      AuthEntityData(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  AuthEntityData copyWithCompanion(AuthEntityCompanion data) {
    return AuthEntityData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthEntityData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthEntityData &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password);
}

class AuthEntityCompanion extends UpdateCompanion<AuthEntityData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  const AuthEntityCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  AuthEntityCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
  })  : email = Value(email),
        password = Value(password);
  static Insertable<AuthEntityData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  AuthEntityCompanion copyWith(
      {Value<int>? id, Value<String>? email, Value<String>? password}) {
    return AuthEntityCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthEntityCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftWrapper extends GeneratedDatabase {
  _$DriftWrapper(QueryExecutor e) : super(e);
  $DriftWrapperManager get managers => $DriftWrapperManager(this);
  late final $EventEntityTable eventEntity = $EventEntityTable(this);
  late final $AuthEntityTable authEntity = $AuthEntityTable(this);
  Selectable<String> current_timestamp() {
    return customSelect('SELECT CURRENT_TIMESTAMP AS _c0',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<String>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [eventEntity, authEntity];
}

typedef $$EventEntityTableCreateCompanionBuilder = EventEntityCompanion
    Function({
  Value<int> id,
  required String title,
  required DateTime date,
  required String location,
});
typedef $$EventEntityTableUpdateCompanionBuilder = EventEntityCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<DateTime> date,
  Value<String> location,
});

class $$EventEntityTableFilterComposer
    extends Composer<_$DriftWrapper, $EventEntityTable> {
  $$EventEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));
}

class $$EventEntityTableOrderingComposer
    extends Composer<_$DriftWrapper, $EventEntityTable> {
  $$EventEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));
}

class $$EventEntityTableAnnotationComposer
    extends Composer<_$DriftWrapper, $EventEntityTable> {
  $$EventEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);
}

class $$EventEntityTableTableManager extends RootTableManager<
    _$DriftWrapper,
    $EventEntityTable,
    EventEntityData,
    $$EventEntityTableFilterComposer,
    $$EventEntityTableOrderingComposer,
    $$EventEntityTableAnnotationComposer,
    $$EventEntityTableCreateCompanionBuilder,
    $$EventEntityTableUpdateCompanionBuilder,
    (
      EventEntityData,
      BaseReferences<_$DriftWrapper, $EventEntityTable, EventEntityData>
    ),
    EventEntityData,
    PrefetchHooks Function()> {
  $$EventEntityTableTableManager(_$DriftWrapper db, $EventEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> location = const Value.absent(),
          }) =>
              EventEntityCompanion(
            id: id,
            title: title,
            date: date,
            location: location,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required DateTime date,
            required String location,
          }) =>
              EventEntityCompanion.insert(
            id: id,
            title: title,
            date: date,
            location: location,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventEntityTableProcessedTableManager = ProcessedTableManager<
    _$DriftWrapper,
    $EventEntityTable,
    EventEntityData,
    $$EventEntityTableFilterComposer,
    $$EventEntityTableOrderingComposer,
    $$EventEntityTableAnnotationComposer,
    $$EventEntityTableCreateCompanionBuilder,
    $$EventEntityTableUpdateCompanionBuilder,
    (
      EventEntityData,
      BaseReferences<_$DriftWrapper, $EventEntityTable, EventEntityData>
    ),
    EventEntityData,
    PrefetchHooks Function()>;
typedef $$AuthEntityTableCreateCompanionBuilder = AuthEntityCompanion Function({
  Value<int> id,
  required String email,
  required String password,
});
typedef $$AuthEntityTableUpdateCompanionBuilder = AuthEntityCompanion Function({
  Value<int> id,
  Value<String> email,
  Value<String> password,
});

class $$AuthEntityTableFilterComposer
    extends Composer<_$DriftWrapper, $AuthEntityTable> {
  $$AuthEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));
}

class $$AuthEntityTableOrderingComposer
    extends Composer<_$DriftWrapper, $AuthEntityTable> {
  $$AuthEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));
}

class $$AuthEntityTableAnnotationComposer
    extends Composer<_$DriftWrapper, $AuthEntityTable> {
  $$AuthEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$AuthEntityTableTableManager extends RootTableManager<
    _$DriftWrapper,
    $AuthEntityTable,
    AuthEntityData,
    $$AuthEntityTableFilterComposer,
    $$AuthEntityTableOrderingComposer,
    $$AuthEntityTableAnnotationComposer,
    $$AuthEntityTableCreateCompanionBuilder,
    $$AuthEntityTableUpdateCompanionBuilder,
    (
      AuthEntityData,
      BaseReferences<_$DriftWrapper, $AuthEntityTable, AuthEntityData>
    ),
    AuthEntityData,
    PrefetchHooks Function()> {
  $$AuthEntityTableTableManager(_$DriftWrapper db, $AuthEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              AuthEntityCompanion(
            id: id,
            email: email,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String email,
            required String password,
          }) =>
              AuthEntityCompanion.insert(
            id: id,
            email: email,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuthEntityTableProcessedTableManager = ProcessedTableManager<
    _$DriftWrapper,
    $AuthEntityTable,
    AuthEntityData,
    $$AuthEntityTableFilterComposer,
    $$AuthEntityTableOrderingComposer,
    $$AuthEntityTableAnnotationComposer,
    $$AuthEntityTableCreateCompanionBuilder,
    $$AuthEntityTableUpdateCompanionBuilder,
    (
      AuthEntityData,
      BaseReferences<_$DriftWrapper, $AuthEntityTable, AuthEntityData>
    ),
    AuthEntityData,
    PrefetchHooks Function()>;

class $DriftWrapperManager {
  final _$DriftWrapper _db;
  $DriftWrapperManager(this._db);
  $$EventEntityTableTableManager get eventEntity =>
      $$EventEntityTableTableManager(_db, _db.eventEntity);
  $$AuthEntityTableTableManager get authEntity =>
      $$AuthEntityTableTableManager(_db, _db.authEntity);
}
