import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'data/database/recipe_db.dart';
import 'data/database/connection.dart';

void main() => runApp(const RecipeApp());

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  late RecipeDatabase db;
  late RecipeDao dao;
  DatabaseMode mode = DatabaseMode.memory;

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  void _initDB() {
    db = RecipeDatabase(mode: mode);
    dao = RecipeDao(db);
    setState(() {});
  }

  void _switchMode() {
    db.close();
    setState(() {
      mode = mode == DatabaseMode.memory
          ? DatabaseMode.persistent
          : DatabaseMode.memory;
      _initDB();
    });
  }

  void _addRecipe() async {
    await dao.insertRecipe(DbRecipeCompanion(
      label: Value('Recipe #${DateTime.now().second}'),
      description: const Value('A quick demo recipe 🍜'),
    ));
  }

  void _deleteRecipe(int id) async => await dao.deleteRecipe(id);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.teal,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          title: Text('Recipe Demo (${mode.name})'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _switchMode,
              icon: const Icon(Icons.swap_horiz_rounded),
              tooltip: 'Switch memory/persistent',
            ),
          ],
        ),
        body: StreamBuilder<List<DbRecipeData>>(
          stream: dao.watchAllRecipes(),
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            if (data.isEmpty) {
              return const Center(
                child: Text(
                  'No recipes yet.\nTap + to add one!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final r = data[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(r.id.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(r.label,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17)),
                    subtitle: Text(r.description,
                        style:
                        const TextStyle(fontSize: 13, color: Colors.black54)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _deleteRecipe(r.id),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addRecipe,
          icon: const Icon(Icons.add),
          label: const Text("Add"),
        ),
      ),
    );
  }
}
