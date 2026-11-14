import 'package:drawapp/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('application shows a list of drawing lessons', (tester) async {
    await tester.pumpWidget(const DrawBuddyApp());

    expect(find.text('Уроци за рисуване'), findsOneWidget);
    expect(find.text('Котка'), findsOneWidget);

    await tester.dragUntilVisible(
      find.text('Автомобил'),
      find.byType(GridView),
      const Offset(0, -200),
    );

    expect(find.text('Автомобил'), findsOneWidget);
  });
}
