import 'package:flutter_test/flutter_test.dart';
import 'package:drawapp/main.dart';

void main() {
  test('there are 20 local drawing lessons', () {
    expect(lessons.length, 20);
  });

  test('all lesson categories are present', () {
    final categories = lessons.map((lesson) => lesson.category).toSet();
    expect(categories, containsAll({'Животни', 'Коли', 'Къщи'}));
  });
}
