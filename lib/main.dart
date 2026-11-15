import 'dart:math' as math;

import 'package:drawapp/io_asset_loader.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

String normalizeAssetPath(String raw) {
  return raw;
}

IconData categoryIconFor(String category) {
  switch (category) {
    case 'Животни':
      return Icons.pets_rounded;
    case 'Коли':
      return Icons.directions_car_rounded;
    case 'Къщи':
      return Icons.home_rounded;
    case 'Зима':
      return Icons.ac_unit_rounded;
    case 'Плодове':
      return Icons.apple_rounded;
    case 'Зеленчуци':
      return Icons.eco_rounded;
    case 'Сгради':
      return Icons.account_balance_rounded;
    case 'Машини':
      return Icons.precision_manufacturing_rounded;
    default:
      return Icons.palette_rounded;
  }
}

Color categoryColorFor(String category) {
  switch (category) {
    case 'Животни':
      return const Color(0xFFFFB86B);
    case 'Коли':
      return const Color(0xFF60D394);
    case 'Къщи':
      return const Color(0xFF7CC6FF);
    case 'Зима':
      return const Color(0xFF8AD7FF);
    case 'Плодове':
      return const Color(0xFFEF6F6C);
    case 'Зеленчуци':
      return const Color(0xFF7CD87E);
    case 'Сгради':
      return const Color(0xFFB28DFF);
    case 'Машини':
      return const Color(0xFF6DD3D9);
    default:
      return const Color(0xFFB39DDB);
  }
}

DrawingLesson _winterLesson({
  required int id,
  required String slug,
  required String title,
  required String emoji,
  required Color accent,
  required List<String> steps,
}) => DrawingLesson(
  id: id,
  category: '\u0417\u0438\u043c\u0430',
  title: title,
  emoji: emoji,
  accent: accent,
  finalPreviewAsset: 'assets/lessons/$slug/final_preview.svg',
  stepAssets: List.generate(steps.length, (index) =>
    'assets/lessons/$slug/step_${(index + 1).toString().padLeft(2, '0')}.svg'),
  prompt: '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 $title.',
  voiceText: '\u041f\u0440\u043e\u0441\u043b\u0435\u0434\u0432\u0430\u0439 \u0441\u0442\u044a\u043f\u043a\u0438\u0442\u0435 \u0435\u0434\u043d\u0430 \u0441\u043b\u0435\u0434 \u0434\u0440\u0443\u0433\u0430.',
  steps: steps,
);

final List<DrawingLesson> lessons = [
  DrawingLesson(
    id: 1,
    category: 'Животни',
    title: 'Котка',
    emoji: '🐱',
    accent: const Color(0xFFFFD166),

    finalPreviewAsset: 'assets/lessons/cat/final_preview.svg',
    stepAssets: [
      'assets/lessons/cat/step_01.svg',
      'assets/lessons/cat/step_02.svg',
      'assets/lessons/cat/step_03.svg',
      'assets/lessons/cat/step_04.svg',
      'assets/lessons/cat/step_05.svg',
      'assets/lessons/cat/step_06.svg',
    ],
    prompt: 'Нарисувай котка: кръгло тяло, две уши, очи, мустаци и дълга опашка.',
    voiceText:
        'Първо начертавай голям кръг. После добави две уши, две очи и мустаци. Накрая нарисувай опашката и ушите са остри.',
    steps: [
      'Нарисувай голям кръг.',
      'Добави две уши и две очи.',
      'Нарисувай мустаци и опашка.',
    ],
  ),
  DrawingLesson(
    id: 2,
    category: 'Животни',
    title: 'Куче',
    emoji: '🐶',
    accent: const Color(0xFF7CC6FE),

    finalPreviewAsset: 'assets/lessons/dog/final_preview.svg',
    stepAssets: [
      'assets/lessons/dog/step_01.svg',
      'assets/lessons/dog/step_02.svg',
      'assets/lessons/dog/step_03.svg',
      'assets/lessons/dog/step_04.svg',
      'assets/lessons/dog/step_05.svg',
      'assets/lessons/dog/step_06.svg',
      'assets/lessons/dog/step_07.svg',
    ],
    prompt: 'Нарисувай куче с триъгълна глава, нос, уши и лапи.',
    voiceText: 'Създай една голяма глава, после ушите, носа и очите. След това добави лапи и опашка.',
    steps: [
      'Начертавай голяма глава.',
      'Добави уши и нос.',
      'Нарисувай лапи и опашка.',
    ],
  ),
  DrawingLesson(
    id: 3,
    category: 'Животни',
    title: 'Лисица',
    emoji: '🦊',
    accent: const Color(0xFFFFA66B),

    finalPreviewAsset: 'assets/lessons/fox/final_preview.svg',
    stepAssets: [
      'assets/lessons/fox/step_01.svg',
      'assets/lessons/fox/step_02.svg',
      'assets/lessons/fox/step_03.svg',
      'assets/lessons/fox/step_04.svg',
      'assets/lessons/fox/step_05.svg',
      'assets/lessons/fox/step_06.svg',
    ],
    prompt: 'Нарисувай лисица: първо глава, после уши, очи, нос, тяло и опашка.',
    voiceText: 'Първо начертавай главата. После оформяй ушите. След това добави очите, носа и муцуната. След това голямото тяло и най-накрая пухкавата опашка.',
    steps: [
      'Начертавай голямата глава.',
      'Добави двете остри уши.',
      'Нарисувай очите, носа и муцуната.',
      'Добави тялото и лапите.',
      'Нарисувай пухкавата опашка и финалните линии.',
    ],
    teacherPrompts: [
      'Начертавай голямата глава.',
      'Сега добави двете остри уши.',
      'Сега направи очите, носа и муцуната.',
      'Добави тялото и лапите.',
      'Накрая нарисувай пухкавата опашка.',
    ],
  ),
  DrawingLesson(
    id: 4,
    category: 'Животни',
    title: 'Зайче',
    emoji: '🐰',
    accent: const Color(0xFFD9C2FF),

    finalPreviewAsset: 'assets/lessons/bunny/final_preview.svg',
    stepAssets: [
      'assets/lessons/bunny/step_01.svg',
      'assets/lessons/bunny/step_02.svg',
      'assets/lessons/bunny/step_03.svg',
      'assets/lessons/bunny/step_04.svg',
      'assets/lessons/bunny/step_05.svg',
      'assets/lessons/bunny/step_06.svg',
      'assets/lessons/bunny/step_07.svg',
      'assets/lessons/bunny/step_08.svg',
    ],
    prompt: 'Нарисувай заек с дълги уши, овално тяло и малък нос.',
    voiceText: 'Начертавай овално тяло. После направи два дълги уши. Добави малки очи, нос и лапички.',
    steps: [
      'Нарисувай овално тяло.',
      'Добави дълги уши.',
      'Нарисувай очи, нос и лапи.',
    ],
  ),
  DrawingLesson(
    id: 5,
    category: 'Животни',
    title: 'Рибка',
    emoji: '🐟',
    accent: const Color(0xFF7AE582),

    finalPreviewAsset: 'assets/lessons/fish/final_preview.svg',
    stepAssets: [
      'assets/lessons/fish/step_01.svg',
      'assets/lessons/fish/step_02.svg',
      'assets/lessons/fish/step_03.svg',
      'assets/lessons/fish/step_04.svg',
      'assets/lessons/fish/step_05.svg',
      'assets/lessons/fish/step_06.svg',
      'assets/lessons/fish/step_07.svg',
      'assets/lessons/fish/step_08.svg',
    ],
    prompt: 'Нарисувай рибка с овално тяло, перки и опашка.',
    voiceText: 'Сложи яйцевидно тяло. Добави две перки нагоре и една голяма опашка. Дорисувай око и устни.',
    steps: [
      'Начертавай овално тяло.',
      'Добави перки и опашка.',
      'Дорисувай око и устни.',
    ],
  ),
  DrawingLesson(
    id: 6,
    category: 'Животни',
    title: 'Пингвин',
    emoji: '🐧',
    accent: const Color(0xFFB8C0FF),

    finalPreviewAsset: 'assets/lessons/penguin/final_preview.svg',
    stepAssets: [
      'assets/lessons/penguin/step_01.svg',
      'assets/lessons/penguin/step_02.svg',
      'assets/lessons/penguin/step_03.svg',
      'assets/lessons/penguin/step_04.svg',
      'assets/lessons/penguin/step_05.svg',
      'assets/lessons/penguin/step_06.svg',
      'assets/lessons/penguin/step_07.svg',
      'assets/lessons/penguin/step_08.svg',
    ],
    prompt: 'Нарисувай пингвин с бяло коремче, клюн и малки лапи.',
    voiceText: 'Направи черно тяло с бяло коремче. Добави малки очи, жълт клюн и две лапички.',
    steps: [
      'Начертавай тяло.',
      'Добави бяло коремче.',
      'Дорисувай очи, клюн и лапи.',
    ],
  ),
  DrawingLesson(
    id: 7,
    category: 'Животни',
    title: 'Слон',
    emoji: '🐘',
    accent: const Color(0xFFB0D7FF),

    finalPreviewAsset: 'assets/lessons/elephant/final_preview.svg',
    stepAssets: [
      'assets/lessons/elephant/step_01.svg',
      'assets/lessons/elephant/step_02.svg',
      'assets/lessons/elephant/step_03.svg',
      'assets/lessons/elephant/step_04.svg',
      'assets/lessons/elephant/step_05.svg',
      'assets/lessons/elephant/step_06.svg',
      'assets/lessons/elephant/step_07.svg',
      'assets/lessons/elephant/step_08.svg',
    ],
    prompt: 'Нарисувай слон с големи уши, хобот и малки очи.',
    voiceText: 'Начертавай кръгло тяло и огромни уши. После нарисувай хобота, очите и краката.',
    steps: [
      'Нарисувай голямо тяло.',
      'Добави уши и хобот.',
      'Дорисувай очи и крака.',
    ],
  ),
  DrawingLesson(
    id: 8,
    category: 'Животни',
    title: 'Пеперуда',
    emoji: '🦋',
    accent: const Color(0xFFFFB4A2),

    finalPreviewAsset: 'assets/lessons/butterfly/final_preview.svg',
    stepAssets: [
      'assets/lessons/butterfly/step_01.svg',
      'assets/lessons/butterfly/step_02.svg',
      'assets/lessons/butterfly/step_03.svg',
      'assets/lessons/butterfly/step_04.svg',
      'assets/lessons/butterfly/step_05.svg',
      'assets/lessons/butterfly/step_06.svg',
    ],
    prompt: 'Нарисувай пеперуда с две крила, тънко тяло и усмивка.',
    voiceText: 'Начертавай две симетрични крила. След това направи тънко тяло и антенки. Накрая добави малки точки върху крилата.',
    steps: [
      'Нарисувай двете крила.',
      'Добави тяло и антени.',
      'Дорисувай детайли по крилата.',
    ],
  ),
  DrawingLesson(
    id: 9,
    category: 'Коли',
    title: 'Автомобил',
    emoji: '🚗',
    accent: const Color(0xFF7AE582),

    finalPreviewAsset: 'assets/lessons/car/final_preview.svg',
    stepAssets: [
      'assets/lessons/car/step_01.svg',
      'assets/lessons/car/step_02.svg',
      'assets/lessons/car/step_03.svg',
      'assets/lessons/car/step_04.svg',
      'assets/lessons/car/step_05.svg',
      'assets/lessons/car/step_06.svg',
    ],
    prompt: 'Нарисувай кола с правоъгълно тяло, колела и фарове.',
    voiceText: 'Начертавай правоъгълно тяло. Добави две колела, прозорци и накрая фаровете.',
    steps: [
      'Начертавай правоъгълно тяло.',
      'Добави колела.',
      'Нарисувай прозорци и фарове.',
    ],
  ),
  DrawingLesson(
    id: 10,
    category: 'Коли',
    title: 'Камион',
    emoji: '🚚',
    accent: const Color(0xFFFFD166),

    finalPreviewAsset: 'assets/lessons/truck/final_preview.svg',
    stepAssets: [
      'assets/lessons/truck/step_01.svg',
      'assets/lessons/truck/step_02.svg',
      'assets/lessons/truck/step_03.svg',
      'assets/lessons/truck/step_04.svg',
      'assets/lessons/truck/step_05.svg',
      'assets/lessons/truck/step_06.svg',
    ],
    prompt: 'Нарисувай камион с голяма кабина, платформа и колела.',
    voiceText: 'Създай голяма кабина и дълга платформа. След това добави четири колела и светлини.',
    steps: [
      'Начертавай кабина.',
      'Добави платформа.',
      'Дорисувай колела и светлини.',
    ],
  ),
  DrawingLesson(
    id: 11,
    category: 'Коли',
    title: 'Ван',
    emoji: '🚐',
    accent: const Color(0xFF90E0EF),

    finalPreviewAsset: 'assets/lessons/van/final_preview.svg',
    stepAssets: [
      'assets/lessons/van/step_01.svg',
      'assets/lessons/van/step_02.svg',
      'assets/lessons/van/step_03.svg',
      'assets/lessons/van/step_04.svg',
      'assets/lessons/van/step_05.svg',
      'assets/lessons/van/step_06.svg',
    ],
    prompt: 'Нарисувай ван с голямо пространство, прозорци и две колела.',
    voiceText: 'Начертавай правоъгълник с голямо пространство. Добави прозорци и колела. Накрая направи малка врата.',
    steps: [
      'Направи основната форма.',
      'Добави прозорци.',
      'Дорисувай колела и дверци.',
    ],
  ),
  DrawingLesson(
    id: 12,
    category: 'Коли',
    title: 'Трактор',
    emoji: '🚜',
    accent: const Color(0xFFD9C2FF),

    finalPreviewAsset: 'assets/lessons/tractor/final_preview.svg',
    stepAssets: [
      'assets/lessons/tractor/step_01.svg',
      'assets/lessons/tractor/step_02.svg',
      'assets/lessons/tractor/step_03.svg',
      'assets/lessons/tractor/step_04.svg',
      'assets/lessons/tractor/step_05.svg',
      'assets/lessons/tractor/step_06.svg',
    ],
    prompt: 'Нарисувай трактор с голяма кабина, големи колела и малка рука.',
    voiceText: 'Начертавай голяма кабина и тяло. След това добави два големи колела и малка ръка отпред.',
    steps: [
      'Нарисувай кабина.',
      'Добави големи колела.',
      'Дорисувай отделения и ръката.',
    ],
  ),
  DrawingLesson(
    id: 13,
    category: 'Коли',
    title: 'Пожарна кола',
    emoji: '🚒',
    accent: const Color(0xFFFF7F7F),

    finalPreviewAsset: 'assets/lessons/firetruck/final_preview.svg',
    stepAssets: [
      'assets/lessons/firetruck/step_01.svg',
      'assets/lessons/firetruck/step_02.svg',
      'assets/lessons/firetruck/step_03.svg',
      'assets/lessons/firetruck/step_04.svg',
      'assets/lessons/firetruck/step_05.svg',
      'assets/lessons/firetruck/step_06.svg',
    ],
    prompt: 'Нарисувай пожарна кола с червено тяло и сини светлини.',
    voiceText: 'Начертавай червено тяло и кабината. Добави колела и две сини светлини. Накрая рисувай люка и звънец.',
    steps: [
      'Направи основния корпус.',
      'Добави колела и люкове.',
      'Дорисувай светлини и звънец.',
    ],
  ),
  DrawingLesson(
    id: 14,
    category: 'Коли',
    title: 'Полицейски камион',
    emoji: '🚓',
    accent: const Color(0xFF6DA9FF),

    finalPreviewAsset: 'assets/lessons/police/final_preview.svg',
    stepAssets: [
      'assets/lessons/police/step_01.svg',
      'assets/lessons/police/step_02.svg',
      'assets/lessons/police/step_03.svg',
      'assets/lessons/police/step_04.svg',
      'assets/lessons/police/step_05.svg',
      'assets/lessons/police/step_06.svg',
    ],
    prompt: 'Нарисувай полицейска кола с сини и червени ленти и светлини.',
    voiceText: 'Начертавай голямо тяло. Добави синьо-червени ленти, колела и светлини. Накрая добави вратата и фаровете.',
    steps: [
      'Начертавай тялото.',
      'Добави ленти и светлини.',
      'Дорисувай колела и врата.',
    ],
  ),
  DrawingLesson(
    id: 15,
    category: 'Къщи',
    title: 'Къща',
    emoji: '🏠',
    accent: const Color(0xFFB9FBC0),

    finalPreviewAsset: 'assets/lessons/house/final_preview.svg',
    stepAssets: [
      'assets/lessons/house/step_01.svg',
      'assets/lessons/house/step_02.svg',
      'assets/lessons/house/step_03.svg',
      'assets/lessons/house/step_04.svg',
      'assets/lessons/house/step_05.svg',
      'assets/lessons/house/step_06.svg',
    ],
    prompt: 'Нарисувай къща с правоъгълници, покрив и врата.',
    voiceText: 'Начертавай голям квадрат. После добави покрива и вратата. Накрая нарисувай прозорци и комин.',
    steps: [
      'Нарисувай основния квадрат.',
      'Добави покрива и вратата.',
      'Дорисувай прозорци и комин.',
    ],
  ),
  DrawingLesson(
    id: 16,
    category: 'Къщи',
    title: 'Малка къща',
    emoji: '🏡',
    accent: const Color(0xFFFACBFF),

    finalPreviewAsset: 'assets/lessons/small_house/final_preview.svg',
    stepAssets: [
      'assets/lessons/small_house/step_01.svg',
      'assets/lessons/small_house/step_02.svg',
      'assets/lessons/small_house/step_03.svg',
      'assets/lessons/small_house/step_04.svg',
      'assets/lessons/small_house/step_05.svg',
      'assets/lessons/small_house/step_06.svg',
    ],
    prompt: 'Нарисувай малка къща с кръгло цветно дворче и покрив.',
    voiceText: 'Създай малка къща с покрив и врата. Добави две малки прозорчета и дърво до нея.',
    steps: [
      'Начертавай малката къща.',
      'Добави покрива.',
      'Дорисувай прозорците и дървото.',
    ],
  ),
  DrawingLesson(
    id: 17,
    category: 'Къщи',
    title: 'Вила',
    emoji: '🏝️',
    accent: const Color(0xFFFFD166),

    finalPreviewAsset: 'assets/lessons/villa/final_preview.svg',
    stepAssets: [
      'assets/lessons/villa/step_01.svg',
      'assets/lessons/villa/step_02.svg',
      'assets/lessons/villa/step_03.svg',
      'assets/lessons/villa/step_04.svg',
      'assets/lessons/villa/step_05.svg',
      'assets/lessons/villa/step_06.svg',
    ],
    prompt: 'Нарисувай вила с две къщи, палми и пътека.',
    voiceText: 'Направи голяма основна къща и една по-малка до нея. Добави палми и пътека отпред.',
    steps: [
      'Начертавай къщите.',
      'Добави покривите.',
      'Дорисувай палмите и пътеката.',
    ],
  ),
  DrawingLesson(
    id: 18,
    category: 'Къщи',
    title: 'Пързалка',
    emoji: '🛝',
    accent: const Color(0xFFBDE0FE),

    finalPreviewAsset: 'assets/lessons/playground/final_preview.svg',
    stepAssets: [
      'assets/lessons/playground/step_01.svg',
      'assets/lessons/playground/step_02.svg',
      'assets/lessons/playground/step_03.svg',
      'assets/lessons/playground/step_04.svg',
      'assets/lessons/playground/step_05.svg',
    ],
    prompt: 'Нарисувай пързалка, стълби и безопасна площадка.',
    voiceText: 'Начертавай детска площадка, след това стълбите и пързалката. Добави ограда и малка сянка.',
    steps: [
      'Начертавай платформата.',
      'Добави стълбите.',
      'Дорисувай пързалката и оградата.',
    ],
  ),
  DrawingLesson(
    id: 19,
    category: 'Къщи',
    title: 'Параход',
    emoji: '🛶',
    accent: const Color(0xFF9AD1D4),

    finalPreviewAsset: 'assets/lessons/boat/final_preview.svg',
    stepAssets: [
      'assets/lessons/boat/step_01.svg',
      'assets/lessons/boat/step_02.svg',
      'assets/lessons/boat/step_03.svg',
      'assets/lessons/boat/step_04.svg',
      'assets/lessons/boat/step_05.svg',
    ],
    prompt: 'Нарисувай малък лоден кораб, вълни и флагче.',
    voiceText: 'Начертавай дълго тяло на лодка. После добави флагче и вълни под нея. Накрая добави малък мачт.',
    steps: [
      'Начертавай лодката.',
      'Добави мачта и флаг.',
      'Дорисувай вълните.',
    ],
  ),
  DrawingLesson(
    id: 20,
    category: 'Къщи',
    title: 'Слънчев дом',
    emoji: '🏠',
    accent: const Color(0xFFFFE69A),

    finalPreviewAsset: 'assets/lessons/sun_house/final_preview.svg',
    stepAssets: [
      'assets/lessons/sun_house/step_01.svg',
      'assets/lessons/sun_house/step_02.svg',
      'assets/lessons/sun_house/step_03.svg',
      'assets/lessons/sun_house/step_04.svg',
      'assets/lessons/sun_house/step_05.svg',
      'assets/lessons/sun_house/step_06.svg',
    ],
    prompt: 'Нарисувай слънчев дом с покрив, прозорци, дърво и слънце.',
    voiceText: 'Начертавай къща с покрив и врата. Добави слънце в небето. Накрая добави дърво и големи прозорци.',
    steps: [
      'Нарисувай къщата.',
      'Добави покрива и слънцето.',
      'Дорисувай прозорци и дърво.',
    ],
  ),
  DrawingLesson(
    id: 21,
    category: 'Зима',
    title: 'Снежен човек',
    emoji: '⛄',
    accent: const Color(0xFFBFE7FF),

    finalPreviewAsset: 'assets/lessons/snowman/final_preview.svg',
    stepAssets: [
      'assets/lessons/snowman/step_01.svg',
      'assets/lessons/snowman/step_02.svg',
      'assets/lessons/snowman/step_03.svg',
      'assets/lessons/snowman/step_04.svg',
      'assets/lessons/snowman/step_05.svg',
    ],
    prompt: 'Нарисувай снежен човек с две снежни топки, шапка и малък шал.',
    voiceText: 'Първо начертавай голям кръг за тялото. После добави по-малък кръг за главата. Накрая нарисувай шапката, очите, носа и метлата.',
    steps: [
      'Начертавай голямото тяло.',
      'Добави главата и шапката.',
      'Дорисувай очи, нос, шал и метла.',
    ],
  ),
  DrawingLesson(
    id: 22,
    category: 'Плодове',
    title: 'Ябълка',
    emoji: '🍎',
    accent: const Color(0xFFFFB3B3),

    finalPreviewAsset: 'assets/lessons/apple/final_preview.svg',
    stepAssets: [
      'assets/lessons/apple/step_01.svg',
      'assets/lessons/apple/step_02.svg',
      'assets/lessons/apple/step_03.svg',
      'assets/lessons/apple/step_04.svg',
      'assets/lessons/apple/step_05.svg',
    ],
    prompt: 'Нарисувай ябълка с овална форма, дръжка и листо.',
    voiceText: 'Започни с овална ябълка. Добави дръжката и листото. Накрая направи малка вдлъбнатина в дъното.',
    steps: [
      'Начертавай ябълката.',
      'Добави дръжката и листото.',
      'Дорисувай дъното и детайлите.',
    ],
  ),
  DrawingLesson(
    id: 23,
    category: 'Плодове',
    title: 'Круша',
    emoji: '🍐',
    accent: const Color(0xFFBFEBA9),

    finalPreviewAsset: 'assets/lessons/pear/final_preview.svg',
    stepAssets: [
      'assets/lessons/pear/step_01.svg',
      'assets/lessons/pear/step_02.svg',
      'assets/lessons/pear/step_03.svg',
      'assets/lessons/pear/step_04.svg',
      'assets/lessons/pear/step_05.svg',
    ],
    prompt: 'Нарисувай круша с дълга форма, дръжка и листо.',
    voiceText: 'Направи леко удължена форма. После добави дръжката и листото. Накрая направи дълбока линия в средата.',
    steps: [
      'Начертавай формата на крушата.',
      'Добави дръжката и листото.',
      'Дорисувай браздата.',
    ],
  ),
  DrawingLesson(
    id: 24,
    category: 'Плодове',
    title: 'Портокал',
    emoji: '🍊',
    accent: const Color(0xFFFFCF73),

    finalPreviewAsset: 'assets/lessons/orange/final_preview.svg',
    stepAssets: [
      'assets/lessons/orange/step_01.svg',
      'assets/lessons/orange/step_02.svg',
      'assets/lessons/orange/step_03.svg',
      'assets/lessons/orange/step_04.svg',
      'assets/lessons/orange/step_05.svg',
    ],
    prompt: 'Нарисувай портокал с кръгла форма и малка дръжка.',
    voiceText: 'Начертавай кръг. После добави дръжката и малките сегменти. Накрая направи къса линия по средата.',
    steps: [
      'Начертавай право кръг.',
      'Добави дръжката.',
      'Дорисувай сегментите.',
    ],
  ),
  DrawingLesson(
    id: 25,
    category: 'Плодове',
    title: 'Банан',
    emoji: '🍌',
    accent: const Color(0xFFEADF5B),

    finalPreviewAsset: 'assets/lessons/banana/final_preview.svg',
    stepAssets: [
      'assets/lessons/banana/step_01.svg',
      'assets/lessons/banana/step_02.svg',
      'assets/lessons/banana/step_03.svg',
      'assets/lessons/banana/step_04.svg',
      'assets/lessons/banana/step_05.svg',
    ],
    prompt: 'Нарисувай банан с дълга полу-овална форма.',
    voiceText: 'Начертавай дълъг полукръг. После добави краищата и малка бразда. Накрая направи лек завой по средата.',
    steps: [
      'Начертавай дългия банан.',
      'Добави горната и долната линия.',
      'Дорисувай сегментите.',
    ],
  ),
  DrawingLesson(
    id: 26,
    category: 'Плодове',
    title: 'Грозде',
    emoji: '🍇',
    accent: const Color(0xFFB38BFF),

    finalPreviewAsset: 'assets/lessons/grapes/final_preview.svg',
    stepAssets: [
      'assets/lessons/grapes/step_01.svg',
      'assets/lessons/grapes/step_02.svg',
      'assets/lessons/grapes/step_03.svg',
      'assets/lessons/grapes/step_04.svg',
      'assets/lessons/grapes/step_05.svg',
    ],
    prompt: 'Нарисувай гроздето с малки кръгли зърна и листо.',
    voiceText: 'Създай малки кръгли плодчета в група. Накрая добави листото и стъблото. Прави формата леко спретната и симетрична.',
    steps: [
      'Начертавай плодовете в група.',
      'Добави стъблото и листото.',
      'Довърши симетрията.',
    ],
  ),
  DrawingLesson(
    id: 27,
    category: 'Плодове',
    title: 'Ягода',
    emoji: '🍓',
    accent: const Color(0xFFFF8A8A),

    finalPreviewAsset: 'assets/lessons/strawberry/final_preview.svg',
    stepAssets: [
      'assets/lessons/strawberry/step_01.svg',
      'assets/lessons/strawberry/step_02.svg',
      'assets/lessons/strawberry/step_03.svg',
      'assets/lessons/strawberry/step_04.svg',
      'assets/lessons/strawberry/step_05.svg',
    ],
    prompt: 'Нарисувай ягода с малки семена и зелено листо.',
    voiceText: 'Начертавай сладко яйцевидно тяло. Добави малки семена и зелени листа. Накрая добави дръжката.',
    steps: [
      'Начертавай ягодата.',
      'Добави семената и листата.',
      'Дорисувай дръжката.',
    ],
  ),
  DrawingLesson(
    id: 28,
    category: 'Плодове',
    title: 'Диня',
    emoji: '🍉',
    accent: const Color(0xFF7EDC8A),

    finalPreviewAsset: 'assets/lessons/watermelon/final_preview.svg',
    stepAssets: [
      'assets/lessons/watermelon/step_01.svg',
      'assets/lessons/watermelon/step_02.svg',
      'assets/lessons/watermelon/step_03.svg',
      'assets/lessons/watermelon/step_04.svg',
      'assets/lessons/watermelon/step_05.svg',
    ],
    prompt: 'Нарисувай диня с вълнообразна форма и семена.',
    voiceText: 'Начертавай голяма овална диня. Добави светли линии и семена. След това направи малка дръжка.',
    steps: [
      'Начертавай основната форма.',
      'Добави линиите и семената.',
      'Дорисувай дръжката.',
    ],
  ),
  DrawingLesson(
    id: 29,
    category: 'Плодове',
    title: 'Праскова',
    emoji: '🍑',
    accent: const Color(0xFFFFAA7A),

    finalPreviewAsset: 'assets/lessons/peach/final_preview.svg',
    stepAssets: [
      'assets/lessons/peach/step_01.svg',
      'assets/lessons/peach/step_02.svg',
      'assets/lessons/peach/step_03.svg',
      'assets/lessons/peach/step_04.svg',
      'assets/lessons/peach/step_05.svg',
    ],
    prompt: 'Нарисувай праскова с гладка форма и зелена дръжка.',
    voiceText: 'Първо начертавай пухкава плодова форма. Добави дръжката и листото. Накрая направи лек завой около ръба.',
    steps: [
      'Начертавай формата на прасковата.',
      'Добави дръжката и листото.',
      'Довърши ръба.',
    ],
  ),
  DrawingLesson(
    id: 30,
    category: 'Плодове',
    title: 'Череша',
    emoji: '🍒',
    accent: const Color(0xFFFC5B68),

    finalPreviewAsset: 'assets/lessons/cherry/final_preview.svg',
    stepAssets: [
      'assets/lessons/cherry/step_01.svg',
      'assets/lessons/cherry/step_02.svg',
      'assets/lessons/cherry/step_03.svg',
      'assets/lessons/cherry/step_04.svg',
      'assets/lessons/cherry/step_05.svg',
    ],
    prompt: 'Нарисувай череша с две сливи и зелени листа.',
    voiceText: 'Направи две малки кръгли череши. Добави стъблата и листата. Накрая допълни фините детайли.',
    steps: [
      'Начертавай двете череши.',
      'Добави стъблата.',
      'Дорисувай листата.',
    ],
  ),
  DrawingLesson(
    id: 31,
    category: 'Плодове',
    title: 'Лимон',
    emoji: '🍋',
    accent: const Color(0xFFF9E76D),

    finalPreviewAsset: 'assets/lessons/lemon/final_preview.svg',
    stepAssets: [
      'assets/lessons/lemon/step_01.svg',
      'assets/lessons/lemon/step_02.svg',
      'assets/lessons/lemon/step_03.svg',
      'assets/lessons/lemon/step_04.svg',
      'assets/lessons/lemon/step_05.svg',
    ],
    prompt: 'Нарисувай лимон с вълнообразна форма и малка дръжка.',
    voiceText: 'Начертавай леко овален лимон. После добави дръжката и малките сегменти. Накрая направи вълнообразни линии.',
    steps: [
      'Начертавай лимонът.',
      'Добави дръжката.',
      'Дорисувай сегментите.',
    ],
  ),
  DrawingLesson(
    id: 32,
    category: 'Зеленчуци',
    title: 'Морков',
    emoji: '🥕',
    accent: const Color(0xFFFFB366),

    finalPreviewAsset: 'assets/lessons/carrot/final_preview.svg',
    stepAssets: [
      'assets/lessons/carrot/step_01.svg',
      'assets/lessons/carrot/step_02.svg',
      'assets/lessons/carrot/step_03.svg',
      'assets/lessons/carrot/step_04.svg',
      'assets/lessons/carrot/step_05.svg',
    ],
    prompt: 'Нарисувай морков с заострена форма и зелени листа.',
    voiceText: 'Начертавай остро удължено коренче. Добави зеленията листа. Накрая направи малка дълбочина по средата.',
    steps: [
      'Начертавай моркова.',
      'Добави листата.',
      'Дорисувай детайлите.',
    ],
  ),
  DrawingLesson(
    id: 33,
    category: 'Зеленчуци',
    title: 'Домат',
    emoji: '🍅',
    accent: const Color(0xFFFF6B6B),

    finalPreviewAsset: 'assets/lessons/tomato/final_preview.svg',
    stepAssets: [
      'assets/lessons/tomato/step_01.svg',
      'assets/lessons/tomato/step_02.svg',
      'assets/lessons/tomato/step_03.svg',
      'assets/lessons/tomato/step_04.svg',
      'assets/lessons/tomato/step_05.svg',
    ],
    prompt: 'Нарисувай домат с кръгла форма и зелено дръжче.',
    voiceText: 'Начертавай кръгъл домат. Добави дръжчето и листото. Накрая направи малки семенни линии.',
    steps: [
      'Начертавай домата.',
      'Добави дръжчето и листото.',
      'Дорисувай детайлите.',
    ],
  ),
  DrawingLesson(
    id: 34,
    category: 'Зеленчуци',
    title: 'Краставица',
    emoji: '🥒',
    accent: const Color(0xFF7DE48A),

    finalPreviewAsset: 'assets/lessons/cucumber/final_preview.svg',
    stepAssets: [
      'assets/lessons/cucumber/step_01.svg',
      'assets/lessons/cucumber/step_02.svg',
      'assets/lessons/cucumber/step_03.svg',
      'assets/lessons/cucumber/step_04.svg',
      'assets/lessons/cucumber/step_05.svg',
    ],
    prompt: 'Нарисувай краставица с удължена форма и малки бразди.',
    voiceText: 'Направи дълга цилиндрична форма. Добави леките линии и дръжката. Накрая направи върха.',
    steps: [
      'Начертавай формата.',
      'Добави браздите.',
      'Дорисувай дръжката.',
    ],
  ),
  DrawingLesson(
    id: 35,
    category: 'Зеленчуци',
    title: 'Чушка',
    emoji: '🌶️',
    accent: const Color(0xFFFF7F7F),

    finalPreviewAsset: 'assets/lessons/pepper/final_preview.svg',
    stepAssets: [
      'assets/lessons/pepper/step_01.svg',
      'assets/lessons/pepper/step_02.svg',
      'assets/lessons/pepper/step_03.svg',
      'assets/lessons/pepper/step_04.svg',
      'assets/lessons/pepper/step_05.svg',
    ],
    prompt: 'Нарисувай чушка с леко сплескана форма и дръжка.',
    voiceText: 'Начертавай малка широколистна чушка. Добави дръжката и листото. Накрая направи тънкия ръб.',
    steps: [
      'Начертавай формата на чушката.',
      'Добави дръжката.',
      'Дорисувай листото.',
    ],
  ),
  DrawingLesson(
    id: 36,
    category: 'Зеленчуци',
    title: 'Картоф',
    emoji: '🥔',
    accent: const Color(0xFFB58C5E),

    finalPreviewAsset: 'assets/lessons/potato/final_preview.svg',
    stepAssets: [
      'assets/lessons/potato/step_01.svg',
      'assets/lessons/potato/step_02.svg',
      'assets/lessons/potato/step_03.svg',
      'assets/lessons/potato/step_04.svg',
      'assets/lessons/potato/step_05.svg',
    ],
    prompt: 'Нарисувай картоф с гладки форми и малки очички.',
    voiceText: 'Начертавай леко неравен корен. Добави дупките и дръжката. Накрая направи плавни линии по краищата.',
    steps: [
      'Начертавай картофа.',
      'Добави дупките.',
      'Дорисувай дръжката.',
    ],
  ),
  DrawingLesson(
    id: 37,
    category: 'Зеленчуци',
    title: 'Броколи',
    emoji: '🥦',
    accent: const Color(0xFF7FD183),

    finalPreviewAsset: 'assets/lessons/broccoli/final_preview.svg',
    stepAssets: [
      'assets/lessons/broccoli/step_01.svg',
      'assets/lessons/broccoli/step_02.svg',
      'assets/lessons/broccoli/step_03.svg',
      'assets/lessons/broccoli/step_04.svg',
      'assets/lessons/broccoli/step_05.svg',
    ],
    prompt: 'Нарисувай броколи с малки зелени цветчета и стъбло.',
    voiceText: 'Първо направи голяма глава от малки кръгли детайли. После добави стъблото и листата. Накрая съединяваш формичките.',
    steps: [
      'Начертавай главата на броколите.',
      'Добави стъблото.',
      'Дорисувай листата.',
    ],
  ),
  DrawingLesson(
    id: 38,
    category: 'Зеленчуци',
    title: 'Лук',
    emoji: '🧅',
    accent: const Color(0xFFD8B4FF),

    finalPreviewAsset: 'assets/lessons/onion/final_preview.svg',
    stepAssets: [
      'assets/lessons/onion/step_01.svg',
      'assets/lessons/onion/step_02.svg',
      'assets/lessons/onion/step_03.svg',
      'assets/lessons/onion/step_04.svg',
      'assets/lessons/onion/step_05.svg',
    ],
    prompt: 'Нарисувай лук с кръгла форма и зелени листа.',
    voiceText: 'Начертавай леко заоблен лук. Добави късото стъбло и листата. Накрая направи вътрешните слоеве.',
    steps: [
      'Начертавай лука.',
      'Добави стъблото.',
      'Дорисувай листата и слоевете.',
    ],
  ),
  DrawingLesson(
    id: 39,
    category: 'Зеленчуци',
    title: 'Зеле',
    emoji: '🥬',
    accent: const Color(0xFF8CE28C),

    finalPreviewAsset: 'assets/lessons/cabbage/final_preview.svg',
    stepAssets: [
      'assets/lessons/cabbage/step_01.svg',
      'assets/lessons/cabbage/step_02.svg',
      'assets/lessons/cabbage/step_03.svg',
      'assets/lessons/cabbage/step_04.svg',
      'assets/lessons/cabbage/step_05.svg',
    ],
    prompt: 'Нарисувай зеле с пухкави листа и стъбло.',
    voiceText: 'Начертавай обща глава от няколко листа. Добави стъблото и последните листа по долу. Завърши с леко разширяване.',
    steps: [
      'Начертавай главата на зелето.',
      'Добави листата.',
      'Дорисувай стъблото.',
    ],
  ),
  DrawingLesson(
    id: 40,
    category: 'Зеленчуци',
    title: 'Царевица',
    emoji: '🌽',
    accent: const Color(0xFFE4D16E),

    finalPreviewAsset: 'assets/lessons/corn/final_preview.svg',
    stepAssets: [
      'assets/lessons/corn/step_01.svg',
      'assets/lessons/corn/step_02.svg',
      'assets/lessons/corn/step_03.svg',
      'assets/lessons/corn/step_04.svg',
      'assets/lessons/corn/step_05.svg',
    ],
    prompt: 'Нарисувай царевица с зърна и листа.',
    voiceText: 'Първо начертавай стъблото и листата. После добави зърната в гъста група. Накрая направи фините детайли.',
    steps: [
      'Начертавай стъблото.',
      'Добави листата.',
      'Дорисувай зърната.',
    ],
  ),
  DrawingLesson(
    id: 41,
    category: 'Зеленчуци',
    title: 'Тиква',
    emoji: '🎃',
    accent: const Color(0xFFFFA857),

    finalPreviewAsset: 'assets/lessons/pumpkin/final_preview.svg',
    stepAssets: [
      'assets/lessons/pumpkin/step_01.svg',
      'assets/lessons/pumpkin/step_02.svg',
      'assets/lessons/pumpkin/step_03.svg',
      'assets/lessons/pumpkin/step_04.svg',
      'assets/lessons/pumpkin/step_05.svg',
    ],
    prompt: 'Нарисувай тиква с заоблена форма и листо.',
    voiceText: 'Начертавай голямо овално тяло. Добави стъблото и листото. Накрая направи малки линии по страните.',
    steps: [
      'Начертавай формата на тиквата.',
      'Добави стъблото и листото.',
      'Дорисувай линиите.',
    ],
  ),
  DrawingLesson(
    id: 42,
    category: 'Сгради',
    title: 'Училище',
    emoji: '🏫',
    accent: const Color(0xFF9CCBFF),

    finalPreviewAsset: 'assets/lessons/school/final_preview.svg',
    stepAssets: [
      'assets/lessons/school/step_01.svg',
      'assets/lessons/school/step_02.svg',
      'assets/lessons/school/step_03.svg',
      'assets/lessons/school/step_04.svg',
      'assets/lessons/school/step_05.svg',
      'assets/lessons/school/step_06.svg',
    ],
    prompt: 'Нарисувай училище с вход, прозорци и покрив.',
    voiceText: 'Начертавай голяма правоъгълна сграда. Добави покрива, входа и прозорците. Накрая направи малка стълба.',
    steps: [
      'Начертавай формата на сградата.',
      'Добави покрива и входа.',
      'Дорисувай прозорците.',
    ],
  ),
  DrawingLesson(
    id: 43,
    category: 'Сгради',
    title: 'Замък',
    emoji: '🏰',
    accent: const Color(0xFFDDBBFF),

    finalPreviewAsset: 'assets/lessons/castle/final_preview.svg',
    stepAssets: [
      'assets/lessons/castle/step_01.svg',
      'assets/lessons/castle/step_02.svg',
      'assets/lessons/castle/step_03.svg',
      'assets/lessons/castle/step_04.svg',
      'assets/lessons/castle/step_05.svg',
      'assets/lessons/castle/step_06.svg',
    ],
    prompt: 'Нарисувай замък с кули, врата и прозорци.',
    voiceText: 'Първо начертавай основната база. После добави две кули и входната врата. Накрая нарисувай прозорците и стените.',
    steps: [
      'Начертавай основната форма.',
      'Добави кулите.',
      'Дорисувай прозорците и вратата.',
    ],
  ),
  DrawingLesson(
    id: 44,
    category: 'Сгради',
    title: 'Пекарна',
    emoji: '🏪',
    accent: const Color(0xFFFFD8A8),

    finalPreviewAsset: 'assets/lessons/bakery/final_preview.svg',
    stepAssets: [
      'assets/lessons/bakery/step_01.svg',
      'assets/lessons/bakery/step_02.svg',
      'assets/lessons/bakery/step_03.svg',
      'assets/lessons/bakery/step_04.svg',
      'assets/lessons/bakery/step_05.svg',
      'assets/lessons/bakery/step_06.svg',
    ],
    prompt: 'Нарисувай пекарна с витрина, покрив и вратa.',
    voiceText: 'Начертавай малка сграда. Добави прозорците и витрината. Накрая направи покрива и вратата.',
    steps: [
      'Начертавай основната сградата.',
      'Добави прозорците.',
      'Дорисувай покрива и вратата.',
    ],
  ),
  DrawingLesson(
    id: 45,
    category: 'Сгради',
    title: 'Кула',
    emoji: '🗼',
    accent: const Color(0xFF9ADFBF),

    finalPreviewAsset: 'assets/lessons/tower/final_preview.svg',
    stepAssets: [
      'assets/lessons/tower/step_01.svg',
      'assets/lessons/tower/step_02.svg',
      'assets/lessons/tower/step_03.svg',
      'assets/lessons/tower/step_04.svg',
      'assets/lessons/tower/step_05.svg',
      'assets/lessons/tower/step_06.svg',
    ],
    prompt: 'Нарисувай кула с високи стени и малки прозорци.',
    voiceText: 'Първо начертавай тясна висока кула. После добави върха и прозорците. Накрая направи основата.',
    steps: [
      'Начертавай формата на кулата.',
      'Добави върха.',
      'Дорисувай прозорците.',
    ],
  ),
  DrawingLesson(
    id: 46,
    category: 'Сгради',
    title: 'Апартамент',
    emoji: '🏢',
    accent: const Color(0xFF9ED7FF),

    finalPreviewAsset: 'assets/lessons/apartment/final_preview.svg',
    stepAssets: [
      'assets/lessons/apartment/step_01.svg',
      'assets/lessons/apartment/step_02.svg',
      'assets/lessons/apartment/step_03.svg',
      'assets/lessons/apartment/step_04.svg',
      'assets/lessons/apartment/step_05.svg',
      'assets/lessons/apartment/step_06.svg',
    ],
    prompt: 'Нарисувай апартамент с много прозорци и вход.',
    voiceText: 'Начертавай висока сграда. После добави редове прозорци и входната врата. Накрая направи покрива и линиите.',
    steps: [
      'Начертавай сградата.',
      'Добави прозорците.',
      'Дорисувай входа.',
    ],
  ),
  DrawingLesson(
    id: 47,
    category: 'Машини',
    title: 'Робот',
    emoji: '🤖',
    accent: const Color(0xFF7DE2D1),

    finalPreviewAsset: 'assets/lessons/robot/final_preview.svg',
    stepAssets: [
      'assets/lessons/robot/step_01.svg',
      'assets/lessons/robot/step_02.svg',
      'assets/lessons/robot/step_03.svg',
      'assets/lessons/robot/step_04.svg',
      'assets/lessons/robot/step_05.svg',
    ],
    prompt: 'Нарисувай робот с главата, ръцете и краката.',
    voiceText: 'Начертавай квадратна глава. Добави очите, ръцете и краката. Накрая направи тялото и жиците.',
    steps: [
      'Начертавай главата.',
      'Добави очите и ръцете.',
      'Дорисувай тялото и краката.',
    ],
  ),
  DrawingLesson(
    id: 48,
    category: 'Машини',
    title: 'Миксер',
    emoji: '🥤',
    accent: const Color(0xFF82D9FF),

    finalPreviewAsset: 'assets/lessons/mixer/final_preview.svg',
    stepAssets: [
      'assets/lessons/mixer/step_01.svg',
      'assets/lessons/mixer/step_02.svg',
      'assets/lessons/mixer/step_03.svg',
      'assets/lessons/mixer/step_04.svg',
      'assets/lessons/mixer/step_05.svg',
    ],
    prompt: 'Нарисувай миксер с контейнер и дръжка.',
    voiceText: 'Начертавай основния контейнер. Добави дръжката и моторната база. Накрая направи силуета на машината.',
    steps: [
      'Начертавай контейнера.',
      'Добави дръжката.',
      'Дорисувай долната база.',
    ],
  ),
  DrawingLesson(
    id: 49,
    category: 'Машини',
    title: 'Дрель',
    emoji: '🛠️',
    accent: const Color(0xFFFFC58F),

    finalPreviewAsset: 'assets/lessons/drill/final_preview.svg',
    stepAssets: [
      'assets/lessons/drill/step_01.svg',
      'assets/lessons/drill/step_02.svg',
      'assets/lessons/drill/step_03.svg',
      'assets/lessons/drill/step_04.svg',
      'assets/lessons/drill/step_05.svg',
    ],
    prompt: 'Нарисувай дрелка с ръкохватка и бита.',
    voiceText: 'Първо начертавай основната дръжка. Добави бита и двигателя. Накрая направи малките детайли.',
    steps: [
      'Начертавай дръжката.',
      'Добави бита.',
      'Довърши мотора и детайлите.',
    ],
  ),
  DrawingLesson(
    id: 50,
    category: 'Машини',
    title: 'Комбайн',
    emoji: '🚜',
    accent: const Color(0xFFB1D9FF),

    finalPreviewAsset: 'assets/lessons/harvester/final_preview.svg',
    stepAssets: [
      'assets/lessons/harvester/step_01.svg',
      'assets/lessons/harvester/step_02.svg',
      'assets/lessons/harvester/step_03.svg',
      'assets/lessons/harvester/step_04.svg',
      'assets/lessons/harvester/step_05.svg',
      'assets/lessons/harvester/step_06.svg',
    ],
    prompt: 'Нарисувай комбайн с голяма кабина и широки колела.',
    voiceText: 'Начертавай дълго тяло с кабина. Добави колелата и широкия корем. Накрая направи входа и детайлите.',
    steps: [
      'Начертавай корпуса.',
      'Добави кабината.',
      'Дорисувай колелата.',
    ],
  ),
  DrawingLesson(
    id: 51,
    category: 'Машини',
    title: 'Вертолет',
    emoji: '🚁',
    accent: const Color(0xFF9BD7FF),

    finalPreviewAsset: 'assets/lessons/helicopter/final_preview.svg',
    stepAssets: [
      'assets/lessons/helicopter/step_01.svg',
      'assets/lessons/helicopter/step_02.svg',
      'assets/lessons/helicopter/step_03.svg',
      'assets/lessons/helicopter/step_04.svg',
      'assets/lessons/helicopter/step_05.svg',
    ],
    prompt: 'Нарисувай хеликоптер с витла, кабина и опашка.',
    voiceText: 'Начертавай малка кабина и крило. Добави витлата, опашката и стойките. Накрая линии и детайли.',
    steps: [
      'Начертавай кабината.',
      'Добави витлата и крилото.',
      'Дорисувай опашката.',
    ],
  ),
  _winterLesson(
    id: 52, slug: 'christmas_tree', title: '\u0415\u043b\u0445\u0430', emoji: '\u{1F384}', accent: const Color(0xFF67A879),
    steps: [
      '\u041e\u0447\u0435\u0440\u0442\u0430\u0439 \u043a\u043b\u043e\u043d\u0438\u0442\u0435 \u043d\u0430 \u0435\u043b\u0445\u0430\u0442\u0430.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0441\u0442\u044a\u0431\u043b\u043e\u0442\u043e \u0438 \u0437\u0432\u0435\u0437\u0434\u0430\u0442\u0430.',
      '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0446\u0432\u0435\u0442\u043d\u0438\u0442\u0435 \u0438\u0433\u0440\u0430\u0447\u043a\u0438.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0433\u0438\u0440\u043b\u044f\u043d\u0434 \u0438 \u0441\u043d\u044f\u0433.',
      '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u043e\u0449\u0435 \u0434\u0435\u0442\u0430\u0439\u043b\u0438.',
      '\u041e\u0444\u043e\u0440\u043c\u0438 \u0441\u043d\u0435\u0436\u043d\u0430\u0442\u0430 \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0430.',
      '\u0417\u0430\u0432\u044a\u0440\u0448\u0438 \u0431\u043b\u0435\u0441\u0442\u044f\u0449\u0438\u0442\u0435 \u043b\u0438\u043d\u0438\u0438.',
    ],
  ),
  _winterLesson(
    id: 53, slug: 'santa', title: '\u0414\u044f\u0434\u043e \u041a\u043e\u043b\u0435\u0434\u0430', emoji: '\u{1F385}', accent: const Color(0xFFE76A62),
    steps: [
      '\u041e\u0447\u0435\u0440\u0442\u0430\u0439 \u043b\u0438\u0446\u0435\u0442\u043e \u0438 \u0442\u044f\u043b\u043e\u0442\u043e.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0447\u0435\u0440\u0432\u0435\u043d\u0430\u0442\u0430 \u0448\u0430\u043f\u043a\u0430.',
      '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u043e\u0447\u0438\u0442\u0435 \u0438 \u043d\u043e\u0441\u0430.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0431\u044f\u043b\u0430\u0442\u0430 \u0431\u0440\u0430\u0434\u0430.',
      '\u041e\u0444\u043e\u0440\u043c\u0438 \u044f\u043a\u0430\u0442\u0430 \u0438 \u043a\u043e\u043b\u0430\u043d\u0430.',
      '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u043a\u043e\u043f\u0447\u0435\u0442\u0430\u0442\u0430 \u0438 \u0440\u044a\u043a\u0430\u0432\u0438\u0442\u0435.',
      '\u0417\u0430\u0432\u044a\u0440\u0448\u0438 \u0431\u044f\u043b\u0430\u0442\u0430 \u043a\u043e\u0442\u0430\u0440\u0430.',
    ],
  ),
  _winterLesson(
    id: 54, slug: 'snowflake', title: '\u0421\u043d\u0435\u0436\u0438\u043d\u043a\u0430', emoji: '\u{2744}\u{FE0F}', accent: const Color(0xFF70B9D9),
    steps: [
      '\u041d\u0430\u0447\u0435\u0440\u0442\u0430\u0439 \u0442\u0440\u0438\u0442\u0435 \u043e\u0441\u0438.',
      '\u041e\u0444\u043e\u0440\u043c\u0438 \u0432\u044a\u0440\u0445\u043e\u0432\u0435\u0442\u0435.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0440\u0430\u043c\u0435\u043d\u0446\u0430 \u043f\u043e \u043b\u044a\u0447\u0438\u0442\u0435.',
      '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0441\u0440\u0435\u0434\u0430\u0442\u0430.',
      '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0444\u0438\u043d\u0438 \u043b\u044a\u0447\u0438\u0446\u0438.',
      '\u0417\u0430\u0432\u044a\u0440\u0448\u0438 \u0441\u0438\u043c\u0435\u0442\u0440\u0438\u0447\u043d\u0438\u0442\u0435 \u0434\u0435\u0442\u0430\u0439\u043b\u0438.',
    ],
  ),
  _winterLesson(
    id: 55, slug: 'reindeer', title: '\u0415\u043b\u0435\u043d\u0447\u0435', emoji: '\u{1F98C}', accent: const Color(0xFFB8845D),
    steps: [
      '\u041e\u0447\u0435\u0440\u0442\u0430\u0439 \u0433\u043b\u0430\u0432\u0430\u0442\u0430 \u0438 \u0442\u044f\u043b\u043e\u0442\u043e.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u0434\u044a\u043b\u0433\u0438\u0442\u0435 \u0440\u043e\u0433\u0430.',
      '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u043e\u0447\u0438\u0442\u0435.',
      '\u0414\u043e\u0431\u0430\u0432\u0438 \u043c\u0443\u0446\u0443\u043d\u043a\u0430 \u0438 \u0447\u0435\u0440\u0432\u0435\u043d \u043d\u043e\u0441.',
      '\u041e\u0444\u043e\u0440\u043c\u0438 \u0442\u043e\u043f\u043b\u0438\u044f \u0448\u0430\u0440\u0444.',
      '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0440\u043e\u0433\u0430\u0442\u0430.',
      '\u0417\u0430\u0432\u044a\u0440\u0448\u0438 \u0443\u0441\u043c\u0438\u0432\u043a\u0430\u0442\u0430 \u0438 \u0440\u0443\u043c\u0435\u043d\u0438\u043d\u0438\u0442\u0435.',
    ],
  ),
  _winterLesson(id: 56, slug: 'ornament_ball', title: '\u0422\u043e\u043f\u043a\u0430 \u0437\u0430 \u0435\u043b\u0445\u0430', emoji: '\u{1F514}', accent: const Color(0xFFD76670), steps: ['\u041d\u0430\u0447\u0435\u0440\u0442\u0430\u0439 \u0442\u043e\u043f\u043a\u0430\u0442\u0430.', '\u0414\u043e\u0431\u0430\u0432\u0438 \u043a\u0430\u0447\u0432\u0430\u043b\u043a\u0430.', '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0432\u044a\u043b\u043d\u0438.', '\u0414\u043e\u0431\u0430\u0432\u0438 \u0434\u0435\u043a\u043e\u0440.', '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0431\u043b\u0435\u0441\u0442\u044f\u0449\u0438\u0442\u0435 \u0434\u0435\u0442\u0430\u0439\u043b\u0438.']),
  _winterLesson(id: 57, slug: 'ornament_star', title: '\u0417\u0432\u0435\u0437\u0434\u0430 \u0437\u0430 \u0435\u043b\u0445\u0430', emoji: '\u{1F31F}', accent: const Color(0xFFF2C85D), steps: ['\u041e\u0447\u0435\u0440\u0442\u0430\u0439 \u043f\u0435\u0442\u0442\u0435 \u043b\u044a\u0447\u0430.', '\u041e\u0444\u043e\u0440\u043c\u0438 \u0441\u0440\u0435\u0434\u0430\u0442\u0430.', '\u0414\u043e\u0431\u0430\u0432\u0438 \u043c\u0430\u043b\u043a\u0430 \u0437\u0432\u0435\u0437\u0434\u0430.', '\u041d\u0430\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0434\u0435\u043a\u043e\u0440\u0430\u0442\u0438\u0432\u043d\u0438\u0442\u0435 \u043b\u0438\u043d\u0438\u0438.', '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u0431\u043b\u0435\u0441\u0442\u044f\u0449\u0438\u0442\u0435 \u0442\u043e\u0447\u043a\u0438.']),
  _winterLesson(id: 58, slug: 'candy_cane', title: '\u0417\u0430\u0445\u0430\u0440\u043d\u0430 \u0442\u0440\u044a\u0441\u0442\u0438\u0447\u043a\u0430', emoji: '\u{1F36D}', accent: const Color(0xFFD95C59), steps: ['\u041e\u0447\u0435\u0440\u0442\u0430\u0439 \u043e\u0433\u044a\u043d\u0430\u0442\u0430\u0442\u0430 \u0444\u043e\u0440\u043c\u0430.', '\u041e\u0444\u043e\u0440\u043c\u0438 \u0431\u044f\u043b\u043e\u0442\u043e \u0437\u0430\u0445\u0430\u0440\u0447\u0435.', '\u0414\u043e\u0431\u0430\u0432\u0438 \u0447\u0435\u0440\u0432\u0435\u043d\u0438\u0442\u0435 \u043b\u0435\u043d\u0442\u0438.', '\u0414\u043e\u0440\u0438\u0441\u0443\u0432\u0430\u0439 \u043e\u0449\u0435 \u043e\u0440\u043d\u0430\u043c\u0435\u043d\u0442\u0438.', '\u0417\u0430\u0432\u044a\u0440\u0448\u0438 \u0431\u043b\u0435\u0441\u0442\u044f\u0449\u0438\u0442\u0435 \u043b\u0438\u043d\u0438\u0438.']),
];

void main() {
  runApp(const DrawBuddyApp());
}

class DrawBuddyApp extends StatelessWidget {
  const DrawBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width >= 768;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Draw Buddy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C8DFF)),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFF1F2A44),
          displayColor: const Color(0xFF1F2A44),
        ),
      ),
      home: LessonHomePage(isTablet: isTablet),
    );
  }
}

class LessonHomePage extends StatelessWidget {
  const LessonHomePage({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final categories = lessons.map((lesson) => lesson.category).toSet().toList();
    final columns = isTablet ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 28 : 18),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 28 : 20,
                      vertical: isTablet ? 24 : 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6E8BFF), Color(0xFF8C7DF5), Color(0xFF5BC0BE)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C9DFF).withValues(alpha: 0.32),
                          blurRadius: 24,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -18,
                          top: -20,
                          child: Container(
                            width: isTablet ? 150 : 110,
                            height: isTablet ? 150 : 110,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 150,
                          bottom: -14,
                          child: Container(
                            width: isTablet ? 120 : 94,
                            height: isTablet ? 120 : 94,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: isTablet ? 88 : 70,
                              height: isTablet ? 88 : 70,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.35),
                                  width: 1.8,
                                ),
                              ),
                              child: const Icon(
                                Icons.auto_awesome_rounded,
                                color: Colors.white,
                                size: 34,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Категории',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    'Draw Buddy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isTablet ? 30 : 24,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.6,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Избери категория и започни страхотно рисуване.',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.92),
                                      fontSize: isTablet ? 17 : 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    '${lessons.length} урока',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Icon(Icons.star_rounded, color: Color(0xFFFFE27A), size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      'Почни сега',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.builder(
                      itemCount: categories.length,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        childAspectRatio: isTablet ? 1.2 : 0.96,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final categoryLessons = lessons
                            .where((lesson) => lesson.category == category)
                            .toList();
                        return CategoryCard(
                          category: category,
                          lessonCount: categoryLessons.length,
                          isTablet: isTablet,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.lessonCount,
    required this.isTablet,
  });

  final String category;
  final int lessonCount;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final color = categoryColorFor(category);
    final icon = categoryIconFor(category);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CategoryLessonsPage(category: category),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                color.withValues(alpha: 0.09),
              ],
            ),
            border: Border.all(
              color: color.withValues(alpha: 0.18),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.18),
                blurRadius: 22,
                spreadRadius: 0,
                offset: const Offset(0, 12),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: EdgeInsets.all(isTablet ? 18 : 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: isTablet ? 74 : 62,
                    height: isTablet ? 74 : 62,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withValues(alpha: 0.22),
                          color.withValues(alpha: 0.38),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.22),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(icon, size: isTablet ? 34 : 28, color: color),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '$lessonCount',
                      style: TextStyle(
                        fontSize: isTablet ? 13 : 11,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                category,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F2A44),
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Уроци',
                style: TextStyle(
                  fontSize: isTablet ? 13 : 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryLessonsPage extends StatelessWidget {
  const CategoryLessonsPage({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final categoryLessons = lessons
        .where((lesson) => lesson.category == category)
        .toList();
    final isTablet = MediaQuery.sizeOf(context).width >= 900;
    final columns = isTablet ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: Text(category),
        backgroundColor: const Color(0xFF7C9DFF),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6E8BFF), Color(0xFF8C7DF5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 22 : 18),
              child: GridView.builder(
                itemCount: categoryLessons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isTablet ? 0.9 : 0.82,
                ),
                itemBuilder: (context, index) {
                  final lesson = categoryLessons[index];
                  return LessonCard(lesson: lesson, isTablet: isTablet);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson, required this.isTablet});

  final DrawingLesson lesson;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final accent = categoryColorFor(lesson.category);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LessonDetailPage(lesson: lesson)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFFFFF), Color(0xFFF7F9FF)],
            ),
            border: Border.all(
              color: accent.withValues(alpha: 0.16),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.14),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: EdgeInsets.all(isTablet ? 18 : 14),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double imageHeight =
                  isTablet ? 182.0 : (constraints.maxWidth > 170 ? 92.0 : 74.0);

              return SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: [
                            accent.withValues(alpha: 0.22),
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.18),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  lesson.finalPreviewAsset,
                                  fit: BoxFit.contain,
                                  semanticsLabel: lesson.title,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 12,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: accent.withValues(alpha: 0.18),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  lesson.emoji,
                                  style: TextStyle(fontSize: isTablet ? 26 : 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        lesson.category,
                        style: TextStyle(
                          fontSize: isTablet ? 11 : 9,
                          fontWeight: FontWeight.w800,
                          color: accent,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      lesson.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isTablet ? 26 : 17,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                        color: const Color(0xFF1F2A44),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            categoryIconFor(lesson.category),
                            size: isTablet ? 17 : 14,
                            color: accent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            lesson.category,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w700,
                              fontSize: isTablet ? 14 : 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LessonDetailPage extends StatefulWidget {
  const LessonDetailPage({super.key, required this.lesson});

  final DrawingLesson lesson;

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  int _currentStepIndex = 0;
  int _repeatToken = 0;
  bool _isCompleted = false;

  void _advanceStep() {
    setState(() {
      if (_isCompleted) return;
      if (_currentStepIndex < widget.lesson.steps.length - 1) {
        _currentStepIndex += 1;
      } else {
        _isCompleted = true;
      }
    });
  }

  void _repeatCurrentStepOrRestart() {
    setState(() {
      _repeatToken += 1;
      if (_isCompleted) {
        _currentStepIndex = 0;
        _isCompleted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width >= 900;
    final totalSteps = widget.lesson.steps.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: const Color(0xFF7C9DFF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isTablet ? 20 : 24),
              child: isTablet
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _LessonVisualCard(
                            lesson: widget.lesson,
                            currentStepIndex: _currentStepIndex,
                            totalSteps: totalSteps,
                            repeatToken: _repeatToken,
                            isCompleted: _isCompleted,
                            onNextStep: _advanceStep,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 1,
                          child: _LessonGuideCard(
                            lesson: widget.lesson,
                            currentStepIndex: _currentStepIndex,
                            totalSteps: totalSteps,
                            isCompleted: _isCompleted,
                            onNextStep: _advanceStep,
                            onRepeatOrRestart: _repeatCurrentStepOrRestart,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _LessonVisualCard(
                          lesson: widget.lesson,
                          currentStepIndex: _currentStepIndex,
                          totalSteps: totalSteps,
                          repeatToken: _repeatToken,
                          isCompleted: _isCompleted,
                          onNextStep: _advanceStep,
                        ),
                        const SizedBox(height: 18),
                        _LessonGuideCard(
                          lesson: widget.lesson,
                          currentStepIndex: _currentStepIndex,
                          totalSteps: totalSteps,
                          isCompleted: _isCompleted,
                          onNextStep: _advanceStep,
                          onRepeatOrRestart: _repeatCurrentStepOrRestart,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LessonVisualCard extends StatefulWidget {
  const _LessonVisualCard({
    required this.lesson,
    required this.currentStepIndex,
    required this.totalSteps,
    required this.repeatToken,
    required this.isCompleted,
    required this.onNextStep,
  });

  final DrawingLesson lesson;
  final int currentStepIndex;
  final int totalSteps;
  final int repeatToken;
  final bool isCompleted;
  final VoidCallback onNextStep;

  @override
  State<_LessonVisualCard> createState() => _LessonVisualCardState();
}

class _LessonVisualCardState extends State<_LessonVisualCard> with TickerProviderStateMixin {
  late final AnimationController _controller;
  List<List<ParsedSvgShape>> _parsedSteps = const [];
  bool _showFinalPreview = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4400))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _loadParsedSteps();
  }

  @override
  void didUpdateWidget(covariant _LessonVisualCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isCompleted && widget.isCompleted) {
      _controller.stop();
      _showFinalPreview = true;
    } else if (oldWidget.currentStepIndex != widget.currentStepIndex ||
        oldWidget.repeatToken != widget.repeatToken ||
        (oldWidget.isCompleted && !widget.isCompleted) ||
        oldWidget.lesson.stepAssets != widget.lesson.stepAssets) {
      _restartStepAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadParsedSteps() async {
    final assets = widget.lesson.stepAssets;

    try {
      final cumulativeSteps = await Future.wait(assets.map(parseSvgDrawingShapesForStep));
      final seenShapeKeys = <String>{};
      final result = cumulativeSteps.map((shapes) {
        final additions = <ParsedSvgShape>[];
        for (var index = 0; index < shapes.length; index++) {
          final shape = shapes[index];
          final key = shape.sourceKey ?? '${shape.path.getBounds()}:$index';
          if (seenShapeKeys.add(key)) additions.add(shape);
        }
        return additions;
      }).toList(growable: false);

      if (!mounted) {
        return;
      }

      setState(() {
        _parsedSteps = result;
      });
      _restartStepAnimation();
    } catch (error, stackTrace) {
      debugPrint('Unable to load drawing steps: $error\n$stackTrace');
    }
  }

  Duration _stepDurationForIndex(int index) {
    final durations = <int, Duration>{
      0: const Duration(milliseconds: 4400),
      1: const Duration(milliseconds: 3300),
      2: const Duration(milliseconds: 3300),
      3: const Duration(milliseconds: 5500),
      4: const Duration(milliseconds: 4400),
    };

    return durations[index] ?? const Duration(milliseconds: 4400);
  }

  void _restartStepAnimation() {
    _showFinalPreview = false;

    if (_parsedSteps.isEmpty) {
      return;
    }

    final safeIndex = widget.currentStepIndex.clamp(0, _parsedSteps.length - 1);
    final stepDuration = _stepDurationForIndex(safeIndex);

    _controller
      ..stop()
      ..duration = stepDuration
      ..reset();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_parsedSteps.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFF8F8), Color(0xFFF5F8FF), Color(0xFFF0FFF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF7C9DFF)),
              SizedBox(height: 14),
              Text(
                'Подготвяме стъпката…',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2B3D72),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final isTablet = MediaQuery.sizeOf(context).width >= 960;
    final canvasHeight = isTablet ? 720.0 : 460.0;
    final prompt = widget.lesson.teacherPrompts.isNotEmpty
        ? widget.lesson.teacherPrompts[widget.currentStepIndex.clamp(0, widget.lesson.teacherPrompts.length - 1)]
        : widget.lesson.steps[widget.currentStepIndex.clamp(0, widget.lesson.steps.length - 1)];

    final completedShapes = <ParsedSvgShape>[];
    final currentShapes = _parsedSteps.isNotEmpty
        ? _parsedSteps[widget.currentStepIndex.clamp(0, _parsedSteps.length - 1)]
        : const <ParsedSvgShape>[];
    final debugText = 'Parsed steps: ${_parsedSteps.length} | Current step shapes: ${currentShapes.length}';

    for (var i = 0; i < widget.currentStepIndex && i < _parsedSteps.length; i++) {
      completedShapes.addAll(_parsedSteps[i]);
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF8F8), Color(0xFFF5F8FF), Color(0xFFF0FFF9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.lesson.category,
                style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF6C8DFF),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C8DFF).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Стъпка ${widget.currentStepIndex + 1}/${widget.totalSteps}',
                  style: const TextStyle(
                    color: Color(0xFF2B3D72),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF3FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFD5E3FF), width: 1.5),
            ),
            child: Text(
              debugText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3F5FB7),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: canvasHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE8ECF3), width: 2),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _CumulativeDrawingPainter(
                      completedShapes: completedShapes,
                      currentShapes: currentShapes,
                      progress: _controller.value,
                    ),
                  ),
                ),
                if (_showFinalPreview)
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.92),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            child: Transform.scale(
                              scale: 0.88,
                              child: SvgPicture.asset(
                                widget.lesson.finalPreviewAsset,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 28,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7C9DFF),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Text(
                                'Браво! Страхотно се справи!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF3FF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFD8E5FF), width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFDFA8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.auto_awesome_rounded, color: Color(0xFFFFB703), size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    prompt,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.isCompleted)
            const SizedBox(height: 12),
          if (widget.isCompleted)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3C4),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFFFD36A), width: 2),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star_rounded, color: Color(0xFFFFB703), size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.lesson.rewardText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF3A2B00),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.sports_kabaddi_rounded, color: Color(0xFFFFB703), size: 22),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _CumulativeDrawingPainter extends CustomPainter {
  const _CumulativeDrawingPainter({
    required this.completedShapes,
    required this.currentShapes,
    required this.progress,
  });

  final List<ParsedSvgShape> completedShapes;
  final List<ParsedSvgShape> currentShapes;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final allPaths = <ParsedSvgShape>[]
      ..addAll(completedShapes)
      ..addAll(currentShapes);

    if (allPaths.isEmpty) {
      return;
    }

    final fullPath = _combineSvgPaths(allPaths);
    final bounds = fullPath.getBounds();
    if (bounds.isEmpty) {
      return;
    }

    final scale = math.min(size.width / bounds.width, size.height / bounds.height) * 0.88;
    final offset = Offset(
      (size.width - bounds.width * scale) / 2 - bounds.left * scale,
      (size.height - bounds.height * scale) / 2 - bounds.top * scale,
    );

    canvas.translate(offset.dx, offset.dy);
    canvas.scale(scale);

    for (final shape in completedShapes) {
      if (shape.fill != null) {
        canvas.drawPath(shape.path, Paint()..color = shape.fill!);
      }
      if (shape.strokeVisible) {
        final paint = Paint()
          ..color = (shape.stroke ?? const Color(0xFF2B5BDA)).withValues(alpha: 0.92)
          ..style = PaintingStyle.stroke
          ..strokeWidth = shape.strokeWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;
        canvas.drawPath(shape.path, paint);
      }
    }

    final activeIndex = currentShapes.isEmpty
        ? 0
        : (progress * currentShapes.length).floor().clamp(0, currentShapes.length - 1);
    var activePoint = Offset.zero;
    for (var index = 0; index < currentShapes.length; index++) {
      final shape = currentShapes[index];
      final shapeProgress = (progress * currentShapes.length - index).clamp(0.0, 1.0);
      if (shapeProgress >= 1 && shape.fill != null) {
        canvas.drawPath(shape.path, Paint()..color = shape.fill!);
      }
      final revealPath = _progressivePath(shape.path, shapeProgress);
      if (shape.strokeVisible) {
        final paint = Paint()
          ..color = const Color(0xFF2F6CFF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = shape.strokeWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..isAntiAlias = true;
        canvas.drawPath(revealPath, paint);
      }
      if (index == activeIndex) {
        activePoint = _pathPointAtProgress(shape.path, shapeProgress);
      }
    }

    final brushPoint = activePoint;
    final brushShadow = Paint()..color = Colors.orange.withValues(alpha: 0.20)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
    canvas.drawCircle(brushPoint, 14, brushShadow);
    canvas.drawCircle(brushPoint, 10, Paint()..color = const Color(0xFFFFB22F));

    final tail = Offset(brushPoint.dx - 14, brushPoint.dy + 8);
    canvas.drawLine(
      tail,
      brushPoint,
      Paint()
        ..color = const Color(0xFF4D2B00)
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _CumulativeDrawingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.completedShapes.length != completedShapes.length ||
        oldDelegate.currentShapes.length != currentShapes.length;
  }
}

class _LessonGuideCard extends StatelessWidget {
  const _LessonGuideCard({
    required this.lesson,
    required this.currentStepIndex,
    required this.totalSteps,
    required this.isCompleted,
    required this.onNextStep,
    required this.onRepeatOrRestart,
  });

  final DrawingLesson lesson;
  final int currentStepIndex;
  final int totalSteps;
  final bool isCompleted;
  final VoidCallback onNextStep;
  final VoidCallback onRepeatOrRestart;

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStepIndex >= totalSteps - 1;
    final teacherPrompt = lesson.teacherPrompts.isNotEmpty
        ? lesson.teacherPrompts[currentStepIndex.clamp(0, lesson.teacherPrompts.length - 1)]
        : lesson.steps[currentStepIndex.clamp(0, lesson.steps.length - 1)];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF4FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.record_voice_over_rounded, color: Color(0xFF7C9DFF), size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Учител',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF7C9DFF),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3C4),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: [
                    for (var star = 0; star < lesson.starCount; star++)
                      const Icon(Icons.star_rounded, color: Color(0xFFFFB703), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${lesson.starCount}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF6A4D00),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TeacherMascot(),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEDF4FF), Color(0xFFF3F9FF), Color(0xFFEFFCF4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: const Color(0xFFD7E7FF), width: 2),
                  ),
                  child: Text(
                    '“$teacherPrompt”',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF233154),
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: Color(0xFFFFB703), size: 20),
              const SizedBox(width: 8),
              Text(
                'Стъпки за рисуване',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1F2A44),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...lesson.steps.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final step = entry.value;
              final isCurrent = index == currentStepIndex;
              final isDone = index < currentStepIndex || (isCompleted && index == currentStepIndex);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCurrent ? const Color(0xFFEAF2FF) : const Color(0xFFFFFDF7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isCurrent ? const Color(0xFF8AA7FF) : const Color(0xFFE8EBF4),
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: const Color(0xFF8AA7FF).withValues(alpha: 0.18),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        margin: const EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          color: isDone ? const Color(0xFF7C9DFF) : isCurrent ? const Color(0xFFB9C9FF) : const Color(0xFFE5EAF8),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            isDone ? '✓' : '${index + 1}',
                            style: TextStyle(
                              color: isDone || isCurrent ? Colors.white : const Color(0xFF7182A7),
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          step,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Color(0xFF26314D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
              onPressed: onRepeatOrRestart,
              icon: Icon(isCompleted ? Icons.restart_alt_rounded : Icons.replay_rounded),
              label: Text(isCompleted ? 'Отново' : 'Повтори стъпка'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEBF1FF),
                    foregroundColor: const Color(0xFF32456E),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: isCompleted ? null : onNextStep,
                  icon: Icon(isLastStep ? Icons.check_rounded : Icons.arrow_forward_rounded),
                  label: Text(isLastStep ? 'Готово' : 'Следваща'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C9DFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeacherMascot extends StatelessWidget {
  const _TeacherMascot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 104,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE7AC), Color(0xFFFFD676), Color(0xFFFFB26B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE9C66B), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8,
            left: 12,
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Color(0xFFE9C66B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 12,
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Color(0xFFE9C66B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 16,
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFB77A52),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 14,
                    left: 12,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2F2F2F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 12,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2F2F2F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    child: Container(
                      width: 22,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8EA3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 54,
              height: 14,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD160),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParsedSvgShape {
  const ParsedSvgShape({
    required this.path,
    required this.fill,
    required this.stroke,
    this.strokeWidth = 7,
    this.strokeVisible = true,
    this.sourceKey,
  });

  final Path path;
  final Color? fill;
  final Color? stroke;
  final double strokeWidth;
  final bool strokeVisible;
  final String? sourceKey;
}

Path _parseSvgPathData(String data) => parseSvgPathData(data);

Path parseSvgPathData(String data) {
  final path = Path();
  final commandMatcher = RegExp(r'[A-Za-z]|[-+]?(?:\d*\.\d+|\d+)(?:[eE][-+]?\d+)?');
  final matches = commandMatcher.allMatches(data).toList();

  if (matches.isEmpty) {
    return path;
  }

  double currentX = 0;
  double currentY = 0;
  double startX = 0;
  double startY = 0;
  String? lastCommand;
  Offset? lastCubicControl;
  Offset? lastQuadraticControl;
  int index = 0;

  while (index < matches.length) {
    final token = matches[index].group(0)!;
    final isCommand = token.length == 1 && token.contains(RegExp(r'[A-Za-z]'));

    if (isCommand) {
      lastCommand = token;
      index += 1;
      continue;
    }

    if (lastCommand == null) {
      index += 1;
      continue;
    }

    final values = <double>[];
    while (index < matches.length) {
      final next = matches[index].group(0)!;
      if (next.length == 1 && next.contains(RegExp(r'[A-Za-z]'))) {
        break;
      }
      values.add(double.parse(next));
      index += 1;
    }

    final command = lastCommand!.toUpperCase();
    final relative = lastCommand != lastCommand!.toUpperCase();

    switch (command) {
      case 'M':
        for (var i = 0; i < values.length; i += 2) {
          final x = relative ? currentX + values[i] : values[i];
          final y = relative ? currentY + values[i + 1] : values[i + 1];
          if (i == 0) {
            currentX = x;
            currentY = y;
            startX = x;
            startY = y;
            path.moveTo(currentX, currentY);
          } else {
            currentX = x;
            currentY = y;
            path.lineTo(currentX, currentY);
          }
        }
        lastCubicControl = null;
        lastQuadraticControl = null;
        break;
      case 'L':
        for (var i = 0; i < values.length; i += 2) {
          final x = relative ? currentX + values[i] : values[i];
          final y = relative ? currentY + values[i + 1] : values[i + 1];
          currentX = x;
          currentY = y;
          path.lineTo(currentX, currentY);
        }
        lastCubicControl = null;
        lastQuadraticControl = null;
        break;
      case 'H':
        for (var i = 0; i < values.length; i++) {
          final x = relative ? currentX + values[i] : values[i];
          currentX = x;
          path.lineTo(currentX, currentY);
        }
        lastCubicControl = null;
        lastQuadraticControl = null;
        break;
      case 'V':
        for (var i = 0; i < values.length; i++) {
          final y = relative ? currentY + values[i] : values[i];
          currentY = y;
          path.lineTo(currentX, currentY);
        }
        lastCubicControl = null;
        lastQuadraticControl = null;
        break;
      case 'C':
        for (var i = 0; i < values.length; i += 6) {
          final x1 = relative ? currentX + values[i] : values[i];
          final y1 = relative ? currentY + values[i + 1] : values[i + 1];
          final x2 = relative ? currentX + values[i + 2] : values[i + 2];
          final y2 = relative ? currentY + values[i + 3] : values[i + 3];
          final x = relative ? currentX + values[i + 4] : values[i + 4];
          final y = relative ? currentY + values[i + 5] : values[i + 5];
          path.cubicTo(x1, y1, x2, y2, x, y);
          lastCubicControl = Offset(x2, y2);
          lastQuadraticControl = null;
          currentX = x;
          currentY = y;
        }
        break;
      case 'S':
        for (var i = 0; i < values.length; i += 4) {
          final x2 = relative ? currentX + values[i] : values[i];
          final y2 = relative ? currentY + values[i + 1] : values[i + 1];
          final x = relative ? currentX + values[i + 2] : values[i + 2];
          final y = relative ? currentY + values[i + 3] : values[i + 3];
          final reflected = _reflectPreviousControl(lastCubicControl, currentX, currentY);
          path.cubicTo(reflected.dx, reflected.dy, x2, y2, x, y);
          lastCubicControl = Offset(x2, y2);
          lastQuadraticControl = null;
          currentX = x;
          currentY = y;
        }
        break;
      case 'Q':
        for (var i = 0; i < values.length; i += 4) {
          final x1 = relative ? currentX + values[i] : values[i];
          final y1 = relative ? currentY + values[i + 1] : values[i + 1];
          final x = relative ? currentX + values[i + 2] : values[i + 2];
          final y = relative ? currentY + values[i + 3] : values[i + 3];
          path.quadraticBezierTo(x1, y1, x, y);
          lastQuadraticControl = Offset(x1, y1);
          lastCubicControl = null;
          currentX = x;
          currentY = y;
        }
        break;
      case 'T':
        for (var i = 0; i < values.length; i += 2) {
          final x = relative ? currentX + values[i] : values[i];
          final y = relative ? currentY + values[i + 1] : values[i + 1];
          final reflected = _reflectPreviousControl(lastQuadraticControl, currentX, currentY);
          path.quadraticBezierTo(reflected.dx, reflected.dy, x, y);
          lastQuadraticControl = Offset(reflected.dx, reflected.dy);
          lastCubicControl = null;
          currentX = x;
          currentY = y;
        }
        break;
      case 'Z':
        path.close();
        currentX = startX;
        currentY = startY;
        lastCubicControl = null;
        lastQuadraticControl = null;
        break;
      case 'A':
        for (var i = 0; i < values.length; i += 7) {
          final rx = values[i];
          final ry = values[i + 1];
          final rotation = values[i + 2];
          final largeArcFlag = values[i + 3] == 1;
          final sweepFlag = values[i + 4] == 1;
          final x = relative ? currentX + values[i + 5] : values[i + 5];
          final y = relative ? currentY + values[i + 6] : values[i + 6];

          final arcRect = Rect.fromCenter(
            center: Offset((currentX + x) / 2, (currentY + y) / 2),
            width: rx.abs() * 2,
            height: ry.abs() * 2,
          );
          final arcPath = Path();
          arcPath.addArc(arcRect, 0, math.pi * 2);
          if (largeArcFlag && sweepFlag) {
            path.addPath(arcPath, Offset.zero);
          }
          currentX = x;
          currentY = y;
          lastCubicControl = null;
          lastQuadraticControl = null;
        }
        break;
      default:
        break;
    }

    if (index < matches.length) {
      final nextToken = matches[index].group(0)!;
      if (nextToken.length == 1 && nextToken.contains(RegExp(r'[A-Za-z]'))) {
        lastCommand = nextToken;
        index += 1;
      }
    }
  }

  return path;
}

Offset _reflectPreviousControl(Offset? previousControl, double currentX, double currentY) {
  if (previousControl == null) {
    return Offset(currentX, currentY);
  }

  return Offset(
    currentX * 2 - previousControl.dx,
    currentY * 2 - previousControl.dy,
  );
}

Path _combineSvgPaths(List<ParsedSvgShape> shapes) {
  final combined = Path();
  for (final shape in shapes) {
    combined.addPath(shape.path, Offset.zero);
  }
  return combined;
}

Path _progressivePath(Path original, double progress) {
  if (progress <= 0) {
    return Path();
  }
  final metrics = original.computeMetrics().toList();
  if (metrics.isEmpty) {
    return original;
  }

  final totalLength = metrics.fold<double>(0, (sum, metric) => sum + metric.length);
  if (totalLength <= 0) {
    return original;
  }

  final targetLength = totalLength * progress.clamp(0.0, 1.0);
  final reveal = Path();
  double travelled = 0;

  for (final metric in metrics) {
    final segmentLength = metric.length;
    if (travelled + segmentLength >= targetLength) {
      reveal.addPath(metric.extractPath(0, targetLength - travelled), Offset.zero);
      break;
    }
    reveal.addPath(metric.extractPath(0, segmentLength), Offset.zero);
    travelled += segmentLength;
  }

  return reveal;
}

Offset _pathPointAtProgress(Path original, double progress) {
  final metrics = original.computeMetrics().toList();
  if (metrics.isEmpty) {
    return Offset.zero;
  }

  final totalLength = metrics.fold<double>(0, (sum, metric) => sum + metric.length);
  if (totalLength <= 0) {
    return original.getBounds().center;
  }

  final targetLength = totalLength * progress.clamp(0.0, 1.0);
  double travelled = 0;

  for (final metric in metrics) {
    if (travelled + metric.length >= targetLength) {
      final localOffset = (targetLength - travelled).clamp(0.0, metric.length);
      final sampleStart = (localOffset - 1.0).clamp(0.0, metric.length);
      final sampleEnd = (localOffset + 1.0).clamp(0.0, metric.length);
      final samplePath = metric.extractPath(sampleStart, sampleEnd);
      final bounds = samplePath.getBounds();
      return bounds.isEmpty ? Offset.zero : bounds.center;
    }
    travelled += metric.length;
  }

  final lastMetric = metrics.last;
  final samplePath = lastMetric.extractPath(lastMetric.length - 1, lastMetric.length);
  final bounds = samplePath.getBounds();
  return bounds.isEmpty ? Offset.zero : bounds.center;
}

Color? _parseSvgColor(String? colorValue) {
  if (colorValue == null || colorValue == 'none') {
    return null;
  }

  final raw = colorValue.trim();
  if (raw.startsWith('#')) {
    final hex = raw.replaceFirst('#', '');
    final value = hex.length == 6 ? 'FF$hex' : hex;
    return Color(int.tryParse(value, radix: 16) ?? 0xFF000000);
  }

  switch (raw.toLowerCase()) {
    case 'black':
      return const Color(0xFF000000);
    case 'white':
      return const Color(0xFFFFFFFF);
    case 'red':
      return const Color(0xFFFF0000);
    default:
      return null;
  }
}

String? _inheritedSvgAttribute(XmlElement element, String name) {
  XmlElement? current = element;
  while (current != null) {
    final value = current.getAttribute(name);
    if (value != null) return value;
    current = current.parentElement;
  }
  return null;
}

bool _svgStrokeIsVisible(XmlElement element) {
  return _inheritedSvgAttribute(element, 'stroke')?.toLowerCase() != 'none';
}

Future<List<ParsedSvgShape>> parseSvgDrawingShapesForStep(String assetPath) async {
  final normalizedAssetPath = normalizeAssetPath(assetPath);
  String rawSvg;
  try {
    rawSvg = await rootBundle.loadString(normalizedAssetPath);
  } catch (_) {
    final fallback = await readTextFromProjectFile(assetPath);
    if (fallback == null || fallback.isEmpty) {
      return const <ParsedSvgShape>[];
    }
    rawSvg = fallback;
  }

  try {
    final document = XmlDocument.parse(rawSvg);
    final shapes = <ParsedSvgShape>[];

    for (final element in document.descendants.whereType<XmlElement>()) {
      final d = element.getAttribute('d');
      if (d != null && d.trim().isNotEmpty) {
        final path = _parseSvgPathData(d);
        if (!path.getBounds().isEmpty) {
          shapes.add(
            ParsedSvgShape(
              path: path,
              fill: _parseSvgColor(_inheritedSvgAttribute(element, 'fill')),
              stroke: _parseSvgColor(_inheritedSvgAttribute(element, 'stroke')),
              strokeWidth: double.tryParse(_inheritedSvgAttribute(element, 'stroke-width') ?? '') ?? 7,
              strokeVisible: _svgStrokeIsVisible(element),
              sourceKey: d.trim(),
            ),
          );
        }
        continue;
      }

      final cx = double.tryParse(element.getAttribute('cx') ?? '');
      final cy = double.tryParse(element.getAttribute('cy') ?? '');
      final rx = double.tryParse(element.getAttribute('rx') ?? '');
      final ry = double.tryParse(element.getAttribute('ry') ?? '');
      final r = double.tryParse(element.getAttribute('r') ?? '');

      if (element.name.local == 'circle' && r != null && cx != null && cy != null) {
        final path = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy), width: r * 2, height: r * 2));
        shapes.add(ParsedSvgShape(path: path, fill: _parseSvgColor(_inheritedSvgAttribute(element, 'fill')), stroke: _parseSvgColor(_inheritedSvgAttribute(element, 'stroke')), strokeWidth: double.tryParse(_inheritedSvgAttribute(element, 'stroke-width') ?? '') ?? 7, strokeVisible: _svgStrokeIsVisible(element), sourceKey: 'circle:$cx:$cy:$r'));
        continue;
      }

      if (element.name.local == 'ellipse' && rx != null && ry != null && cx != null && cy != null) {
        final path = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy), width: rx * 2, height: ry * 2));
        shapes.add(ParsedSvgShape(path: path, fill: _parseSvgColor(_inheritedSvgAttribute(element, 'fill')), stroke: _parseSvgColor(_inheritedSvgAttribute(element, 'stroke')), strokeWidth: double.tryParse(_inheritedSvgAttribute(element, 'stroke-width') ?? '') ?? 7, strokeVisible: _svgStrokeIsVisible(element), sourceKey: 'ellipse:$cx:$cy:$rx:$ry'));
        continue;
      }

      if (element.name.local == 'line') {
        final x1 = double.tryParse(element.getAttribute('x1') ?? '');
        final y1 = double.tryParse(element.getAttribute('y1') ?? '');
        final x2 = double.tryParse(element.getAttribute('x2') ?? '');
        final y2 = double.tryParse(element.getAttribute('y2') ?? '');
        if (x1 != null && y1 != null && x2 != null && y2 != null) {
          final path = Path()
            ..moveTo(x1, y1)
            ..lineTo(x2, y2);
          shapes.add(ParsedSvgShape(path: path, fill: _parseSvgColor(_inheritedSvgAttribute(element, 'fill')), stroke: _parseSvgColor(_inheritedSvgAttribute(element, 'stroke')), strokeWidth: double.tryParse(_inheritedSvgAttribute(element, 'stroke-width') ?? '') ?? 7, strokeVisible: _svgStrokeIsVisible(element), sourceKey: 'line:$x1:$y1:$x2:$y2'));
        }
      }
    }

    return shapes;
  } catch (e, stack) {
    debugPrint('Unable to parse drawing SVG $assetPath: $e\n$stack');
    rethrow;
  }
}

class _ContourRevealPainter extends CustomPainter {
  const _ContourRevealPainter({
    required this.shapes,
    required this.progress,
    required this.revealColor,
    required this.brushColor,
  });

  final List<ParsedSvgShape> shapes;
  final double progress;
  final Color revealColor;
  final Color brushColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (shapes.isEmpty) {
      return;
    }

    final combinedPath = _combineSvgPaths(shapes);
    final bounds = combinedPath.getBounds();
    if (bounds.isEmpty) {
      return;
    }

    final scale = math.min(size.width / bounds.width, size.height / bounds.height);
    final offset = Offset(
      (size.width - bounds.width * scale) / 2 - bounds.left * scale,
      (size.height - bounds.height * scale) / 2 - bounds.top * scale,
    );

    canvas.translate(offset.dx, offset.dy);
    canvas.scale(scale);

    final basePaint = Paint()
      ..color = revealColor.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final revealPaint = Paint()
      ..color = revealColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(combinedPath, basePaint);
    canvas.drawPath(_progressivePath(combinedPath, progress), revealPaint);

    final pathProgressPoint = _pathPointAtProgress(combinedPath, progress);
    final brushPaint = Paint()..color = brushColor;
    canvas.drawCircle(pathProgressPoint, 8, brushPaint);
  }

  @override
  bool shouldRepaint(covariant _ContourRevealPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.shapes.length != shapes.length;
  }
}

const _carStageText = <String>[
  'Начертай основния корпус.',
  'Добави двете колела.',
  'Оформи кабината и прозорците.',
  'Добави характерните части за този автомобил.',
  'Начертай долната линия и броните.',
  'Довърши фаровете и малките детайли.',
];
const _fruitStageText = <String>[
  'Начертай формата на плода.',
  'Добави зелената част около дръжката.',
  'Покажи светлите отблясъци и шарките.',
  'Добави още един характерен акцент по плода.',
  'Довърши дръжката и фините линии.',
];
const _vegetableStageText = <String>[
  'Начертай формата на зеленчука.',
  'Добави листата или зелената част.',
  'Оформи шарките и релефа.',
  'Добави още малки шарки по зеленчука.',
  'Довърши дръжката и малките детайли.',
];

const Map<String, List<String>> _drawingStageText = {
  'cat': ['Нарисувай закръгленото тяло и предните лапички.', 'Добави извита опашка отстрани.', 'Очерти голямата глава и двете остри уши.', 'Оцвети вътрешността на ушите и добави меките шарки.', 'Нарисувай големите очи, нослето, муцунката и мустачките.', 'Довърши гърдите и малките линии по лапичките.'],
  'dog': ['Нарисувай седналото тяло и задните лапички.', 'Добави извита опашка отстрани.', 'Оформи дългите клепнали уши.', 'Очерти голямата кръгла глава.', 'Добави широката светла муцунка.', 'Нарисувай очите, веждите, големия нос и усмивката.', 'Довърши нашийника и линиите по предните лапи.'],
  'bunny': ['Нарисувай седналото тяло и задните лапи.', 'Очерти главата и двете дълги уши.', 'Оцвети вътрешността на ушите.', 'Добави очите и румените бузки.', 'Нарисувай нослето, усмивката и мустачките.', 'Оформи предните лапи и пухкавата опашка.', 'Добави меките линии по ушите.', 'Довърши лапичките и детайлите по козината.'],
  'elephant': ['Очерти кръглата глава и извивката на хобота.', 'Добави двете големи уши.', 'Нарисувай седналото тяло.', 'Оформи предните крака и страничните лапи.', 'Оцвети ушите и добави големите очи.', 'Нарисувай усмивката, гънките и румените бузки.', 'Добави веждите и фините линии по лицето.', 'Довърши пръстчетата и малкото цвете.'],
  'animal': ['Начертай тялото.', 'Добави главата и ушите.', 'Оформи муцунката и очите.', 'Добави носа и опашката.', 'Довърши козината и усмивката.'],
  'fish': ['Очерти оранжевото тяло на рибката.', 'Добави широката опашка.', 'Нарисувай горната и долните перки.', 'Оформи двете бели ленти.', 'Добави голямото око, бузката и устата.', 'Подчертай черните контури на лентите.', 'Добави светлите отблясъци по тялото.', 'Нарисувай мехурчетата и малките сърца.'],
  'penguin': ['Очерти тялото на пингвина.', 'Добави светлото коремче.', 'Нарисувай двете широки крилца.', 'Оформи белите очи и тъмните зеници.', 'Добави оранжевото човче.', 'Нарисувай двете крачета.', 'Добави топлото шалче.', 'Довърши веждите и перата по коремчето.'],
  'butterfly': ['Очерти големите симетрични крила.', 'Добави цветните шарки по крилата.', 'Нарисувай тялото на пеперудата.', 'Добави двете извити антени.', 'Оформи кръглите петънца по крилата.', 'Довърши фините линии и шарки.'],
  'fox': ['Очерти овалното тяло.', 'Добави главата, ушите и опашката.', 'Нарисувай светлите петна по лицето и гърдите.', 'Добави очите, нослето, усмивката и предните лапи.', 'Оформи белия връх на опашката и пухкавите линии.', 'Довърши цветовете и малките детайли.'],
  'car': _carStageText,
  'truck': ['Начертай дългия корпус и кабината.', 'Добави големите колела.', 'Оформи стъклата на кабината.', 'Добави товарната част и страничните детайли.', 'Начертай бронята и долната линия.', 'Довърши фаровете и кантовете.'],
  'van': ['Начертай корпуса на буса.', 'Добави колелата.', 'Оформи предното и страничните стъкла.', 'Добави вратите и страничната линия.', 'Начертай бронята и праговете.', 'Довърши дръжките и фаровете.'],
  'tractor': ['Начертай корпуса и високата кабина.', 'Добави голямото задно и малкото предно колело.', 'Оформи стъклото на кабината.', 'Добави декоративната линия по корпуса.', 'Начертай линията под колелата.', 'Довърши фаровете и детайлите на кабината.'],
  'firetruck': ['Начертай каросерията и кабината.', 'Добави колелата.', 'Оформи прозорците на кабината.', 'Добави стълбата и сигналната лампа.', 'Начертай бронята и долната линия.', 'Довърши светлините и стъпалата.'],
  'police': ['Начертай корпуса на патрулната кола.', 'Добави колелата.', 'Оформи стъклата.', 'Добави маяка на покрива и сините отличителни части.', 'Начертай бронята и долния кант.', 'Довърши фаровете и дребните знаци.'],
  'boat': ['Начертай корпуса на лодката.', 'Добави кабината, мачтата и платното.', 'Начертай вълните под лодката.', 'Оформи прозорците на кабината.', 'Довърши парапетите и въжетата.'],
  'helicopter': ['Начертай кабината на хеликоптера.', 'Добави опашката и малкото задно витло.', 'Оформи прозореца и колесника.', 'Начертай голямото витло отгоре.', 'Довърши линиите по корпуса.'],
  'drill': ['Начертай корпуса на бормашината.', 'Добави страничната ръкохватка и долната дръжка.', 'Оформи свредлото и върха му.', 'Добави отворите за охлаждане.', 'Довърши бутона и детайлите на дръжката.'],
  'mixer': ['Начертай основата на бетоновоза.', 'Добави големия въртящ се барабан.', 'Оформи колелата и кабината.', 'Добави спиралните линии по барабана.', 'Довърши улея и светлините.'],
  'harvester': ['Начертай дългия корпус и кабината.', 'Добави големите колела.', 'Оформи стъклата и житния хедер.', 'Добави декоративната линия по корпуса.', 'Начертай линията под колелата.', 'Довърши фаровете и малките детайли.'],
  'vehicle': _carStageText,
  'house': ['Начертай стените и основната форма на къщата.', 'Добави скатния покрив и комина.', 'Оформи двата прозореца.', 'Добави входната врата и кръглия тавански прозорец.', 'Начертай цветните сандъчета и пътеката.', 'Добави дървото, оградата и последните детайли.'],
  'small_house': ['Начертай стените на малката къща.', 'Добави заобления покрив и комина.', 'Оформи кръглия прозорец и вратата.', 'Добави страничните прозорци.', 'Начертай цветята и лампичките.', 'Добави дървото и пътеката.'],
  'villa': ['Начертай двете нива на вилата.', 'Добави широкия покрив и комина.', 'Оформи големите прозорци.', 'Добави входа, балкона и колоните.', 'Начертай прозорците на горния етаж.', 'Добави двете дървета и фините линии.'],
  'playground': ['Начертай основата и двете кули.', 'Добави покрива на кулата и флагчето.', 'Оформи пързалката.', 'Добави стъпалата и малката врата.', 'Довърши линията на земята.'],
  'sun_house': ['Начертай стените и покрива на къщата.', 'Добави вратата и прозорците.', 'Оформи покривните линии и пътеката.', 'Добави слънцето и лъчите му.', 'Начертай тревата под къщата.', 'Довърши пътеката и малкото цвете.'],
  'snowman': ['Начертай трите снежни топки.', 'Добави шапката и морковения нос.', 'Оформи очите и усмивката.', 'Добави шала и краищата му.', 'Довърши копчетата и ръцете от клонки.'],
  'school': ['Начертай основната сграда.', 'Добави покривната част.', 'Оформи прозорците и входа.', 'Добави часовника и циферблата.', 'Начертай основата и алеята.', 'Довърши малките детайли около сградата.'],
  'castle': ['Начертай стените и назъбените кули.', 'Добави островърхите покриви на кулите.', 'Оформи голямата порта и прозорците.', 'Начертай тревата пред замъка.', 'Добави основната линия под замъка.', 'Довърши малките декоративни акценти.'],
  'bakery': ['Начертай стените и покрива на пекарната.', 'Оформи прозорците и вратата.', 'Добави кантовете на покрива и первазите.', 'Начертай раираната тента и табелата.', 'Добави основната линия под сградата.', 'Довърши малките детайли около витрината.'],
  'tower': ['Начертай високото тяло на кулата.', 'Добави покрития връх.', 'Оформи прозорците по етажите.', 'Добави часовника и стрелките.', 'Начертай основната линия под кулата.', 'Довърши малките детайли около нея.'],
  'apartment': ['Начертай високия корпус на блока.', 'Добави горната част на сградата.', 'Оформи прозорците по етажите.', 'Добави балконите.', 'Начертай основата и входа.', 'Довърши парапетите и детайлите.'],
  'robot': ['Начертай главата и тялото на робота.', 'Добави антената и лампичката.', 'Оформи очите и усмивката.', 'Добави ръцете и бутоните.', 'Довърши краката и централния бутон.'],
  'apple': _fruitStageText,
  'pear': _fruitStageText,
  'orange': _fruitStageText,
  'banana': ['Начертай извитата форма на банана.', 'Добави листенцата в горния край.', 'Покажи светлите отблясъци по кората.', 'Добави малък светъл акцент върху кората.', 'Довърши краищата на банана.'],
  'grapes': ['Начертай грозда от свързани зърна.', 'Добави листото и дръжката.', 'Покажи малките светли отблясъци.', 'Оформи линията на гроздовата чепка.', 'Довърши дръжката и зърната.'],
  'strawberry': ['Начертай формата на ягодата.', 'Добави зелената коронка.', 'Разположи семчиците по плода.', 'Оформи малките отблясъци.', 'Довърши дръжката и семената.'],
  'watermelon': ['Начертай триъгълното парче диня.', 'Добави зелената кора.', 'Нарисувай светлите линии по кората и семките.', 'Добави малък светъл отблясък по динята.', 'Начертай късата дръжка отгоре.'],
  'peach': ['Начертай формата на прасковата.', 'Добави листото и дръжката.', 'Покажи светлите отблясъци и цепката.', 'Оформи линията по средата.', 'Довърши дръжката и контура.'],
  'cherry': ['Начертай двете свързани череши.', 'Добави клончетата над плодовете.', 'Покажи светлите отблясъци.', 'Оформи малките цветни акценти.', 'Довърши дръжката.'],
  'lemon': ['Начертай овалната форма на лимона.', 'Добави листото и дръжката.', 'Покажи светлия отблясък.', 'Оформи малката извивка на кората.', 'Довърши краищата и дръжката.'],
  'carrot': _vegetableStageText,
  'tomato': _vegetableStageText,
  'cucumber': ['Начертай дългата форма на краставицата.', 'Добави малките релефни линии по кората.', 'Оформи светлите точки и шарките.', 'Довърши извивките по кожицата.', 'Добави последните малки детайли.'],
  'pepper': _vegetableStageText,
  'potato': ['Начертай неравната форма на картофа.', 'Добави очичките и кълнчетата.', 'Оформи малките петънца по кората.', 'Довърши светлите линии.', 'Добави фините детайли.'],
  'broccoli': ['Начертай короната на броколито.', 'Добави дебелото стъбло.', 'Оформи малките розички по короната.', 'Добави светлите шарки по броколито.', 'Довърши линията в основата.'],
  'onion': ['Начертай формата на лука.', 'Добави зелените пера.', 'Оформи извивките на люспите.', 'Добави линията в основата.', 'Довърши фините линии по лука.'],
  'cabbage': ['Начертай кръглата форма на зелката.', 'Добави големите външни листа.', 'Оформи жилките на листата.', 'Довърши извивките на листата.', 'Добави последните жилки.'],
  'corn': ['Начертай кочана на царевицата.', 'Добави листата около него.', 'Нарисувай редовете със зърна.', 'Оформи горния край на кочана.', 'Довърши останалите зърна и листа.'],
  'pumpkin': ['Начертай формата на тиквата.', 'Добави дръжката.', 'Оформи ребрата по тиквата.', 'Довърши извивките от двете страни.', 'Добави последните линии по кората.'],
  'christmas_tree': ['Начертай трите зелени нива на елхата.', 'Добави стъблото и звездата на върха.', 'Нарисувай цветните топки.', 'Добави гирлянда по клоните.', 'Оформи още играчки по елхата.', 'Начертай снежната основа.', 'Довърши дребните снежинки и отблясъци.'],
  'santa': ['Начертай тялото и лицето на Дядо Коледа.', 'Добави червената шапка и помпона.', 'Оформи белия кант на шапката и очите.', 'Добави мустаците и носа.', 'Начертай бялата яка и копчетата.', 'Оформи брадата.', 'Довърши ръцете и долния кант на дрехата.'],
  'snowflake': ['Начертай трите дълги лъча на снежинката.', 'Добави разклоненията в краищата.', 'Оформи малките раменца на лъчите.', 'Добави симетричните странични клонки.', 'Начертай кръгчето в средата.', 'Довърши малките снежни точки.'],
  'reindeer': ['Начертай главата и тялото на еленчето.', 'Добави големите уши и рогата.', 'Оформи очите.', 'Добави муцунката и червения нос.', 'Начертай шарфчето и звънчето.', 'Довърши разклоненията на рогата.', 'Добави усмивката и румените бузки.'],
  'ornament_ball': ['Начертай кръглата топка.', 'Добави металната капачка и закачалката.', 'Оформи двете извити ленти.', 'Добави блестящите кръгчета.', 'Довърши малката извивка и украсата.'],
  'ornament_star': ['Начертай петте лъча на звездата.', 'Добави кръгчето в средата.', 'Оформи декоративните линии.', 'Добави малките блестящи точки.', 'Довърши връхчето и отблясъците.'],
  'candy_cane': ['Начертай огънатата форма на бастунчето.', 'Оформи широката бяла захарна лента.', 'Добави първите червени ивици.', 'Довърши останалите ивици.', 'Добави златистите точки и основата.'],
};

class DrawingLesson {
  DrawingLesson({
    required this.id,
    required this.category,
    required this.title,
    required this.emoji,
    required this.accent,
    required this.finalPreviewAsset,
    required List<String> stepAssets,
    required this.prompt,
    required this.voiceText,
    required List<String> steps,
    List<String>? teacherPrompts,
    String? rewardText,
  })  : steps = _stepsForAssets(steps, stepAssets),
        stepAssets = List<String>.unmodifiable(stepAssets),
        teacherPrompts = teacherPrompts != null &&
                teacherPrompts.length == _stepsForAssets(steps, stepAssets).length
            ? teacherPrompts
            : _defaultTeacherPrompts(_stepsForAssets(steps, stepAssets)),
        rewardText = rewardText ?? 'Много добре! Ти завърши картинката и си се справил отлично!';

  static List<String> _normalizeSteps(List<String> steps, int assetCount) {
    final targetCount = assetCount.clamp(5, 8).toInt();
    final list = List<String>.from(steps);
    final filler = [
      'Добави голямата основна форма.',
      'Постави детайлите на лицето и тялото.',
      'Сложи финалните линии и детайли.',
      'Провери симетрията и формата.',
    ];

    if (list.length > targetCount) return List<String>.from(list.take(targetCount));
    for (var i = list.length; i < targetCount; i++) {
      list.add(filler[(list.length - steps.length).clamp(0, filler.length - 1).toInt()]);
    }

    return list;
  }

  static List<String> _defaultTeacherPrompts(List<String> steps) {
    final base = <String>[];
    for (var i = 0; i < steps.length; i++) {
      base.add(steps[i]);
    }
    return base;
  }

  final int id;
  final String category;
  final String title;
  final String emoji;
  final Color accent;
  final String finalPreviewAsset;
  final List<String> stepAssets;
  final String prompt;
  final String voiceText;
  final List<String> steps;
  final List<String> teacherPrompts;
  final String rewardText;

  int get starCount => (steps.length - 2).clamp(3, 5).toInt();

  static List<String> _stepsForAssets(List<String> providedSteps, List<String> assets) {
    if (assets.isNotEmpty) {
      final segments = assets.first.split('/');
      final slug = segments.length > 2 ? segments[2] : '';
      final mapped = _drawingStageText[slug];
      if (mapped != null) return _normalizeSteps(mapped, assets.length);
    }
    return _normalizeSteps(providedSteps, assets.length);
  }
}
