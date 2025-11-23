import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

enum DatabaseMode { memory, persistent }

DatabaseConnection connect({DatabaseMode mode = DatabaseMode.persistent}) {
  if (mode == DatabaseMode.memory) {
    // Dùng memory: dữ liệu biến mất khi tắt app
    return DatabaseConnection(NativeDatabase.memory());
  } else {
    // Dùng persistent: dữ liệu lưu vào file
    return DatabaseConnection(_openFileDatabase());
  }
}

LazyDatabase _openFileDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'recipe_demo.sqlite'));
    return NativeDatabase(file);
  });
}
