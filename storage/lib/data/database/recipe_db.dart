import 'package:drift/drift.dart';
import 'connection.dart' as impl;

part 'recipe_db.g.dart';

class DbRecipe extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
  TextColumn get description => text()();
  BoolColumn get bookmarked => boolean().withDefault(Constant(false))();
}

@DriftDatabase(tables: [DbRecipe])
class RecipeDatabase extends _$RecipeDatabase {
  RecipeDatabase({impl.DatabaseMode mode = impl.DatabaseMode.persistent})
      : super(impl.connect(mode: mode));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [DbRecipe])
class RecipeDao extends DatabaseAccessor<RecipeDatabase> with _$RecipeDaoMixin {
  final RecipeDatabase db;
  RecipeDao(this.db) : super(db);

  Future<List<DbRecipeData>> findAllRecipes() => select(dbRecipe).get();
  Stream<List<DbRecipeData>> watchAllRecipes() => select(dbRecipe).watch();
  Future<int> insertRecipe(Insertable<DbRecipeData> recipe) => into(dbRecipe).insert(recipe);
  Future deleteRecipe(int id) => (delete(dbRecipe)..where((t) => t.id.equals(id))).go();
}
