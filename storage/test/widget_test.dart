import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage/main.dart'; // đường dẫn đến file main.dart của bạn

void main() {
  testWidgets('Recipe add demo test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const RecipeApp());

    // Chờ StreamBuilder load
    await tester.pumpAndSettle();

    // Kiểm tra ban đầu chưa có công thức
    expect(find.textContaining('No recipes'), findsOneWidget);

    // Nhấn nút thêm (+)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Kiểm tra đã thêm 1 công thức
    expect(find.textContaining('Recipe'), findsWidgets);
  });
}
