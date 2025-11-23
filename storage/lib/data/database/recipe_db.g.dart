// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_db.dart';

// ignore_for_file: type=lint
class $DbRecipeTable extends DbRecipe
    with TableInfo<$DbRecipeTable, DbRecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRecipeTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookmarkedMeta = const VerificationMeta(
    'bookmarked',
  );
  @override
  late final GeneratedColumn<bool> bookmarked = GeneratedColumn<bool>(
    'bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bookmarked" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, description, bookmarked];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_recipe';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbRecipeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('bookmarked')) {
      context.handle(
        _bookmarkedMeta,
        bookmarked.isAcceptableOrUnknown(data['bookmarked']!, _bookmarkedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRecipeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      bookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bookmarked'],
      )!,
    );
  }

  @override
  $DbRecipeTable createAlias(String alias) {
    return $DbRecipeTable(attachedDatabase, alias);
  }
}

class DbRecipeData extends DataClass implements Insertable<DbRecipeData> {
  final int id;
  final String label;
  final String description;
  final bool bookmarked;
  const DbRecipeData({
    required this.id,
    required this.label,
    required this.description,
    required this.bookmarked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['description'] = Variable<String>(description);
    map['bookmarked'] = Variable<bool>(bookmarked);
    return map;
  }

  DbRecipeCompanion toCompanion(bool nullToAbsent) {
    return DbRecipeCompanion(
      id: Value(id),
      label: Value(label),
      description: Value(description),
      bookmarked: Value(bookmarked),
    );
  }

  factory DbRecipeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRecipeData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      description: serializer.fromJson<String>(json['description']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'description': serializer.toJson<String>(description),
      'bookmarked': serializer.toJson<bool>(bookmarked),
    };
  }

  DbRecipeData copyWith({
    int? id,
    String? label,
    String? description,
    bool? bookmarked,
  }) => DbRecipeData(
    id: id ?? this.id,
    label: label ?? this.label,
    description: description ?? this.description,
    bookmarked: bookmarked ?? this.bookmarked,
  );
  DbRecipeData copyWithCompanion(DbRecipeCompanion data) {
    return DbRecipeData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      description: data.description.present
          ? data.description.value
          : this.description,
      bookmarked: data.bookmarked.present
          ? data.bookmarked.value
          : this.bookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRecipeData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('description: $description, ')
          ..write('bookmarked: $bookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, description, bookmarked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRecipeData &&
          other.id == this.id &&
          other.label == this.label &&
          other.description == this.description &&
          other.bookmarked == this.bookmarked);
}

class DbRecipeCompanion extends UpdateCompanion<DbRecipeData> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> description;
  final Value<bool> bookmarked;
  const DbRecipeCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.description = const Value.absent(),
    this.bookmarked = const Value.absent(),
  });
  DbRecipeCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String description,
    this.bookmarked = const Value.absent(),
  }) : label = Value(label),
       description = Value(description);
  static Insertable<DbRecipeData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? description,
    Expression<bool>? bookmarked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (description != null) 'description': description,
      if (bookmarked != null) 'bookmarked': bookmarked,
    });
  }

  DbRecipeCompanion copyWith({
    Value<int>? id,
    Value<String>? label,
    Value<String>? description,
    Value<bool>? bookmarked,
  }) {
    return DbRecipeCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      bookmarked: bookmarked ?? this.bookmarked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (bookmarked.present) {
      map['bookmarked'] = Variable<bool>(bookmarked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbRecipeCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('description: $description, ')
          ..write('bookmarked: $bookmarked')
          ..write(')'))
        .toString();
  }
}

abstract class _$RecipeDatabase extends GeneratedDatabase {
  _$RecipeDatabase(QueryExecutor e) : super(e);
  $RecipeDatabaseManager get managers => $RecipeDatabaseManager(this);
  late final $DbRecipeTable dbRecipe = $DbRecipeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbRecipe];
}

typedef $$DbRecipeTableCreateCompanionBuilder =
    DbRecipeCompanion Function({
      Value<int> id,
      required String label,
      required String description,
      Value<bool> bookmarked,
    });
typedef $$DbRecipeTableUpdateCompanionBuilder =
    DbRecipeCompanion Function({
      Value<int> id,
      Value<String> label,
      Value<String> description,
      Value<bool> bookmarked,
    });

class $$DbRecipeTableFilterComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bookmarked => $composableBuilder(
    column: $table.bookmarked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DbRecipeTableOrderingComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bookmarked => $composableBuilder(
    column: $table.bookmarked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbRecipeTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get bookmarked => $composableBuilder(
    column: $table.bookmarked,
    builder: (column) => column,
  );
}

class $$DbRecipeTableTableManager
    extends
        RootTableManager<
          _$RecipeDatabase,
          $DbRecipeTable,
          DbRecipeData,
          $$DbRecipeTableFilterComposer,
          $$DbRecipeTableOrderingComposer,
          $$DbRecipeTableAnnotationComposer,
          $$DbRecipeTableCreateCompanionBuilder,
          $$DbRecipeTableUpdateCompanionBuilder,
          (
            DbRecipeData,
            BaseReferences<_$RecipeDatabase, $DbRecipeTable, DbRecipeData>,
          ),
          DbRecipeData,
          PrefetchHooks Function()
        > {
  $$DbRecipeTableTableManager(_$RecipeDatabase db, $DbRecipeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbRecipeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbRecipeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbRecipeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> bookmarked = const Value.absent(),
              }) => DbRecipeCompanion(
                id: id,
                label: label,
                description: description,
                bookmarked: bookmarked,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String label,
                required String description,
                Value<bool> bookmarked = const Value.absent(),
              }) => DbRecipeCompanion.insert(
                id: id,
                label: label,
                description: description,
                bookmarked: bookmarked,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbRecipeTableProcessedTableManager =
    ProcessedTableManager<
      _$RecipeDatabase,
      $DbRecipeTable,
      DbRecipeData,
      $$DbRecipeTableFilterComposer,
      $$DbRecipeTableOrderingComposer,
      $$DbRecipeTableAnnotationComposer,
      $$DbRecipeTableCreateCompanionBuilder,
      $$DbRecipeTableUpdateCompanionBuilder,
      (
        DbRecipeData,
        BaseReferences<_$RecipeDatabase, $DbRecipeTable, DbRecipeData>,
      ),
      DbRecipeData,
      PrefetchHooks Function()
    >;

class $RecipeDatabaseManager {
  final _$RecipeDatabase _db;
  $RecipeDatabaseManager(this._db);
  $$DbRecipeTableTableManager get dbRecipe =>
      $$DbRecipeTableTableManager(_db, _db.dbRecipe);
}

mixin _$RecipeDaoMixin on DatabaseAccessor<RecipeDatabase> {
  $DbRecipeTable get dbRecipe => attachedDatabase.dbRecipe;
}
