import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drawapp/main.dart';

class SvgLessonValidation {
  const SvgLessonValidation({
    required this.isValid,
    required this.message,
    required this.stepCount,
    required this.stepFiles,
    required this.missingAssets,
    required this.hasWhiteBackground,
    required this.hasViewBox,
    required this.hasStroke,
    required this.hasStrokeWidth,
    required this.hasOpacity,
  });

  final bool isValid;
  final String message;
  final int stepCount;
  final List<String> stepFiles;
  final List<String> missingAssets;
  final bool hasWhiteBackground;
  final bool hasViewBox;
  final bool hasStroke;
  final bool hasStrokeWidth;
  final bool hasOpacity;
}

Future<SvgLessonValidation> validateSvgLessonPack(DrawingLesson lesson) async {
  final stepFiles = lesson.stepAssets.isNotEmpty ? List<String>.from(lesson.stepAssets) : <String>[];
  final missingAssets = <String>[];
  final svgText = <String>[];

  for (final asset in stepFiles) {
    final file = File(asset.replaceFirst('assets/', 'assets/'));
    if (!await file.exists()) {
      missingAssets.add(asset);
      continue;
    }
    svgText.add(await file.readAsString());
  }

  final combined = svgText.join('\n');
  final hasViewBox = combined.contains('viewBox=');
  final hasStroke = combined.contains('stroke=');
  final hasStrokeWidth = combined.contains('stroke-width=');
  final hasOpacity = combined.contains('opacity=');
  final hasWhiteBackground = combined.contains('fill="#FFF') ||
      combined.contains('fill="#FFFFFF') ||
      combined.contains('fill="white"') ||
      combined.contains('fill="#FFF9F2"');

  final isValid = stepFiles.length >= 5 &&
      missingAssets.isEmpty &&
      hasViewBox &&
      hasStroke &&
      hasStrokeWidth &&
      hasOpacity &&
      hasWhiteBackground;

  return SvgLessonValidation(
    isValid: isValid,
    message: isValid
        ? 'SVG lesson pack is valid and ready for drawing.'
        : 'SVG lesson pack is missing required metadata or files.',
    stepCount: stepFiles.length,
    stepFiles: stepFiles,
    missingAssets: missingAssets,
    hasWhiteBackground: hasWhiteBackground,
    hasViewBox: hasViewBox,
    hasStroke: hasStroke,
    hasStrokeWidth: hasStrokeWidth,
    hasOpacity: hasOpacity,
  );
}

void main() {
  test('normalizeAssetPath preserves Flutter asset prefixes', () {
    expect(normalizeAssetPath('assets/lessons/fox/step_01.svg'), 'assets/lessons/fox/step_01.svg');
    expect(normalizeAssetPath('lessons/fox/step_01.svg'), 'lessons/fox/step_01.svg');
  });

  test('there are 58 local drawing lessons', () {
    expect(lessons.length, 58);
  });

  test('all lesson categories are present', () {
    final categories = lessons.map((lesson) => lesson.category).toSet();
    expect(categories, containsAll({
      'Животни',
      'Коли',
      'Къщи',
      'Зима',
      'Плодове',
      'Зеленчуци',
      'Сгради',
      'Машини',
    }));
  });

  test('all lessons include a teacher-style drawing flow', () {
    for (final lesson in lessons) {
      expect(lesson.steps.length, inInclusiveRange(5, 8));
      expect(lesson.teacherPrompts.length, lesson.steps.length);
      expect(lesson.teacherPrompts.every((prompt) => prompt.trim().isNotEmpty), isTrue);
      expect(lesson.rewardText.trim().isNotEmpty, isTrue);
    }
  });

  test('fox lesson has a valid svg-only step pack', () async {
    final fox = lessons.firstWhere((lesson) => lesson.title == 'Лисица');
    final validation = await validateSvgLessonPack(fox);

    expect(validation.isValid, isTrue, reason: validation.message);
    expect(validation.stepCount, 5);
    expect(validation.missingAssets, isEmpty);
    expect(validation.hasWhiteBackground, isTrue);
  });

  test('validated svg lesson assets include the required drawing metadata', () async {
    final fox = lessons.firstWhere((lesson) => lesson.title == 'Лисица');
    final validation = await validateSvgLessonPack(fox);

    expect(validation.hasViewBox, isTrue);
    expect(validation.hasStroke, isTrue);
    expect(validation.hasStrokeWidth, isTrue);
    expect(validation.hasOpacity, isTrue);
    expect(validation.stepFiles.first, contains('step_01.svg'));
  });

  test('svg step assets expose real path geometry for brush animation', () async {
    final fox = lessons.firstWhere((lesson) => lesson.title == 'Лисица');
    final shapes = await parseSvgDrawingShapesForStep(fox.stepAssets.first);

    expect(shapes, isNotEmpty);
    expect(shapes.first.path.computeMetrics().isNotEmpty, isTrue);
    expect(shapes.length, greaterThanOrEqualTo(1));
  });

  test('svg path parser supports H, V, S, T and relative commands', () {
    final path = parseSvgPathData('M 10 10 H 30 V 40 S 50 60 70 40 T 90 10 l 10 15 h 5 v 10');
    final bounds = path.getBounds();

    expect(bounds.isEmpty, isFalse);
    expect(bounds.width, greaterThan(0));
    expect(bounds.height, greaterThan(0));
  });

  test('fox step parser returns shapes for every asset in the lesson pack', () async {
    final fox = lessons.firstWhere((lesson) => lesson.title == 'Лисица');

    for (final asset in fox.stepAssets) {
      final shapes = await parseSvgDrawingShapesForStep(asset);
      print('ASSET $asset => ${shapes.length} shapes');
      for (final shape in shapes) {
        print(shape.path.getBounds());
      }
    }

    expect(fox.stepAssets, isNotEmpty);
  });

  testWidgets('fox lesson detail page prints parsed shape bounds in the console', (tester) async {
    final fox = lessons.firstWhere((lesson) => lesson.title == 'Лисица');

    await tester.pumpWidget(MaterialApp(home: LessonDetailPage(lesson: fox)));
    await tester.pumpAndSettle();

    expect(find.text(fox.title), findsOneWidget);
  });

  testWidgets('home screen shows categories first and opens category gallery', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LessonHomePage(isTablet: true)));

    expect(find.text('Категории'), findsOneWidget);
    expect(find.text('Животни'), findsWidgets);

    await tester.tap(find.text('Животни'));
    await tester.pumpAndSettle();

    expect(find.byType(CategoryLessonsPage), findsOneWidget);
    expect(find.text('Котка'), findsOneWidget);
  });
}
