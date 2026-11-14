import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

IconData categoryIconFor(String category) {
  switch (category) {
    case 'Животни':
      return Icons.pets_rounded;
    case 'Коли':
      return Icons.directions_car_rounded;
    case 'Къщи':
      return Icons.home_rounded;
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
    default:
      return const Color(0xFFB39DDB);
  }
}

final List<DrawingLesson> lessons = [
  DrawingLesson(
    id: 1,
    category: 'Животни',
    title: 'Котка',
    emoji: '🐱',
    accent: const Color(0xFFFFD166),
    svgAsset: 'assets/illustrations/cat.svg',
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
    svgAsset: 'assets/illustrations/dog.svg',
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
    svgAsset: 'assets/illustrations/fox.svg',
    prompt: 'Начертай лисица с триъгълни уши, дълга опашка и заострена муцуна.',
    voiceText: 'Постави муцуната в триъгълна форма. Добави остри уши и дебела пухкава опашка. Накрая нарисувай очите и носа.',
    steps: [
      'Начертавай триъгълна глава.',
      'Направи остри уши.',
      'Добави опашка и лицето.',
    ],
  ),
  DrawingLesson(
    id: 4,
    category: 'Животни',
    title: 'Зайче',
    emoji: '🐰',
    accent: const Color(0xFFD9C2FF),
    svgAsset: 'assets/illustrations/bunny.svg',
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
    svgAsset: 'assets/illustrations/fish.svg',
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
    svgAsset: 'assets/illustrations/penguin.svg',
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
    svgAsset: 'assets/illustrations/elephant.svg',
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
    svgAsset: 'assets/illustrations/butterfly.svg',
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
    svgAsset: 'assets/illustrations/car.svg',
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
    svgAsset: 'assets/illustrations/truck.svg',
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
    svgAsset: 'assets/illustrations/van.svg',
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
    svgAsset: 'assets/illustrations/tractor.svg',
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
    svgAsset: 'assets/illustrations/firetruck.svg',
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
    svgAsset: 'assets/illustrations/police.svg',
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
    svgAsset: 'assets/illustrations/house.svg',
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
    svgAsset: 'assets/illustrations/small_house.svg',
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
    svgAsset: 'assets/illustrations/villa.svg',
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
    svgAsset: 'assets/illustrations/playground.svg',
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
    svgAsset: 'assets/illustrations/boat.svg',
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
    svgAsset: 'assets/illustrations/sun_house.svg',
    prompt: 'Нарисувай слънчев дом с покрив, прозорци, дърво и слънце.',
    voiceText: 'Начертавай къща с покрив и врата. Добави слънце в небето. Накрая добави дърво и големи прозорци.',
    steps: [
      'Нарисувай къщата.',
      'Добави покрива и слънцето.',
      'Дорисувай прозорци и дърво.',
    ],
  ),
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
    final columns = isTablet ? 4 : 2;

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
                      horizontal: isTablet ? 26 : 20,
                      vertical: isTablet ? 22 : 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7C9DFF), Color(0xFF9D8CFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: isTablet ? 76 : 58,
                          height: isTablet ? 76 : 58,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.palette_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Уроци за рисуване',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isTablet ? 32 : 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Следвай интуитивните инструкции и рисувай с радост!',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: isTablet ? 18 : 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.builder(
                      itemCount: lessons.length,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        childAspectRatio: isTablet ? 0.9 : 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final lesson = lessons[index];
                        return LessonCard(lesson: lesson, isTablet: isTablet);
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

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson, required this.isTablet});

  final DrawingLesson lesson;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
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
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.all(isTablet ? 18 : 14),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double imageHeight =
                  isTablet ? 172.0 : (constraints.maxWidth > 170 ? 80.0 : 58.0);

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
                            lesson.accent.withValues(alpha: 0.34),
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                lesson.svgAsset,
                                fit: BoxFit.contain,
                                semanticsLabel: lesson.title,
                              ),
                            ),
                            Positioned(
                              right: 12,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.75),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  lesson.emoji,
                                  style: TextStyle(fontSize: isTablet ? 30 : 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      lesson.category,
                      style: TextStyle(
                        fontSize: isTablet ? 12 : 10,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF6C8DFF),
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lesson.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 17,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        color: const Color(0xFF1F2A44),
                      ),
                    ),
                    const SizedBox(height: 6),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            categoryIconFor(lesson.category),
                            size: isTablet ? 24 : 17,
                            color: categoryColorFor(lesson.category),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            lesson.category,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w700,
                              fontSize: isTablet ? 16 : 12,
                            ),
                          ),
                        ],
                      ),
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
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width >= 900;

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
                          child: _LessonVisualCard(lesson: widget.lesson),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 1,
                          child: _LessonGuideCard(lesson: widget.lesson),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _LessonVisualCard(lesson: widget.lesson),
                        const SizedBox(height: 18),
                        _LessonGuideCard(lesson: widget.lesson),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RevealClip extends CustomClipper<Path> {
  const _RevealClip(this.path, this.progress);

  final Path path;
  final double progress;

  @override
  Path getClip(Size size) {
    final result = Path();
    final metrics = path.computeMetrics();
    final totalLength = metrics.fold<double>(0, (sum, metric) => sum + metric.length);
    var remaining = totalLength * progress;

    for (final metric in metrics) {
      final segmentLength = metric.length;
      if (remaining <= 0) break;
      final drawLength = segmentLength < remaining ? segmentLength : remaining;
      final segment = metric.extractPath(0, drawLength);
      result.addPath(segment, Offset.zero);
      remaining -= drawLength;
    }

    return result;
  }

  @override
  bool shouldReclip(covariant _RevealClip oldClipper) =>
      oldClipper.progress != progress || oldClipper.path != path;
}

class _TracePainter extends CustomPainter {
  const _TracePainter({
    required this.path,
    required this.progress,
    required this.color,
    this.strokeWidth = 7,
  });

  final Path path;
  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final metrics = path.computeMetrics();
    final total = metrics.fold<double>(0, (sum, metric) => sum + metric.length);
    final target = total * progress;
    var remaining = target;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (final metric in metrics) {
      final length = metric.length;
      if (remaining <= 0) break;
      final drawLength = length < remaining ? length : remaining;
      final segment = metric.extractPath(0, drawLength);
      canvas.drawPath(segment, paint);
      remaining -= drawLength;
    }
  }

  @override
  bool shouldRepaint(covariant _TracePainter oldDelegate) {
    return oldDelegate.path != path ||
        oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

class _LessonVisualCard extends StatefulWidget {
  const _LessonVisualCard({required this.lesson});

  final DrawingLesson lesson;

  @override
  State<_LessonVisualCard> createState() => _LessonVisualCardState();
}

class _LessonVisualCardState extends State<_LessonVisualCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Path _buildContourPath(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();

    switch (widget.lesson.title) {
      case 'Котка':
        path.addOval(Rect.fromCenter(center: Offset(width * 0.52, height * 0.54), width: width * 0.46, height: height * 0.48));
        path.moveTo(width * 0.42, height * 0.28);
        path.lineTo(width * 0.28, height * 0.14);
        path.lineTo(width * 0.36, height * 0.34);
        path.moveTo(width * 0.62, height * 0.28);
        path.lineTo(width * 0.76, height * 0.14);
        path.lineTo(width * 0.68, height * 0.34);
        path.moveTo(width * 0.38, height * 0.58);
        path.lineTo(width * 0.26, height * 0.72);
        path.moveTo(width * 0.66, height * 0.58);
        path.lineTo(width * 0.78, height * 0.72);
        path.moveTo(width * 0.54, height * 0.68);
        path.lineTo(width * 0.54, height * 0.86);
        path.moveTo(width * 0.52, height * 0.52);
        path.lineTo(width * 0.68, height * 0.52);
        break;
      case 'Куче':
        path.addOval(Rect.fromCenter(center: Offset(width * 0.52, height * 0.5), width: width * 0.48, height: height * 0.44));
        path.moveTo(width * 0.30, height * 0.30);
        path.lineTo(width * 0.18, height * 0.18);
        path.lineTo(width * 0.24, height * 0.42);
        path.moveTo(width * 0.74, height * 0.30);
        path.lineTo(width * 0.86, height * 0.18);
        path.lineTo(width * 0.80, height * 0.42);
        path.moveTo(width * 0.46, height * 0.52);
        path.lineTo(width * 0.42, height * 0.74);
        path.moveTo(width * 0.58, height * 0.52);
        path.lineTo(width * 0.62, height * 0.74);
        path.moveTo(width * 0.40, height * 0.62);
        path.lineTo(width * 0.28, height * 0.80);
        path.moveTo(width * 0.60, height * 0.62);
        path.lineTo(width * 0.72, height * 0.80);
        break;
      case 'Лисица':
        path.moveTo(width * 0.48, height * 0.20);
        path.lineTo(width * 0.30, height * 0.12);
        path.lineTo(width * 0.36, height * 0.34);
        path.lineTo(width * 0.22, height * 0.42);
        path.lineTo(width * 0.42, height * 0.58);
        path.lineTo(width * 0.58, height * 0.58);
        path.lineTo(width * 0.78, height * 0.42);
        path.lineTo(width * 0.64, height * 0.34);
        path.lineTo(width * 0.70, height * 0.12);
        path.lineTo(width * 0.52, height * 0.20);
        path.close();
        path.moveTo(width * 0.42, height * 0.58);
        path.lineTo(width * 0.52, height * 0.82);
        path.lineTo(width * 0.58, height * 0.58);
        path.moveTo(width * 0.46, height * 0.44);
        path.lineTo(width * 0.54, height * 0.44);
        break;
      case 'Зайче':
        path.addOval(Rect.fromCenter(center: Offset(width * 0.50, height * 0.55), width: width * 0.40, height: height * 0.42));
        path.moveTo(width * 0.26, height * 0.20);
        path.lineTo(width * 0.18, height * 0.02);
        path.lineTo(width * 0.34, height * 0.20);
        path.moveTo(width * 0.74, height * 0.20);
        path.lineTo(width * 0.82, height * 0.02);
        path.lineTo(width * 0.66, height * 0.20);
        path.moveTo(width * 0.34, height * 0.62);
        path.lineTo(width * 0.28, height * 0.80);
        path.moveTo(width * 0.66, height * 0.62);
        path.lineTo(width * 0.72, height * 0.80);
        path.moveTo(width * 0.40, height * 0.52);
        path.lineTo(width * 0.48, height * 0.52);
        break;
      case 'Рибка':
        path.moveTo(width * 0.20, height * 0.52);
        path.quadraticBezierTo(width * 0.38, height * 0.22, width * 0.56, height * 0.24);
        path.quadraticBezierTo(width * 0.76, height * 0.22, width * 0.84, height * 0.52);
        path.quadraticBezierTo(width * 0.76, height * 0.80, width * 0.56, height * 0.76);
        path.quadraticBezierTo(width * 0.38, height * 0.80, width * 0.20, height * 0.52);
        path.moveTo(width * 0.56, height * 0.24);
        path.lineTo(width * 0.86, height * 0.10);
        path.lineTo(width * 0.78, height * 0.34);
        path.moveTo(width * 0.52, height * 0.52);
        path.lineTo(width * 0.52, height * 0.66);
        break;
      case 'Пингвин':
        path.addOval(Rect.fromCenter(center: Offset(width * 0.52, height * 0.54), width: width * 0.42, height: height * 0.52));
        path.moveTo(width * 0.28, height * 0.56);
        path.lineTo(width * 0.16, height * 0.68);
        path.moveTo(width * 0.76, height * 0.56);
        path.lineTo(width * 0.88, height * 0.68);
        path.moveTo(width * 0.46, height * 0.72);
        path.lineTo(width * 0.46, height * 0.86);
        path.moveTo(width * 0.58, height * 0.72);
        path.lineTo(width * 0.58, height * 0.86);
        path.moveTo(width * 0.42, height * 0.36);
        path.lineTo(width * 0.50, height * 0.30);
        path.lineTo(width * 0.58, height * 0.36);
        break;
      case 'Слон':
        path.addOval(Rect.fromCenter(center: Offset(width * 0.52, height * 0.58), width: width * 0.50, height: height * 0.42));
        path.moveTo(width * 0.22, height * 0.48);
        path.lineTo(width * 0.10, height * 0.36);
        path.lineTo(width * 0.20, height * 0.62);
        path.moveTo(width * 0.82, height * 0.48);
        path.lineTo(width * 0.94, height * 0.36);
        path.lineTo(width * 0.84, height * 0.62);
        path.moveTo(width * 0.52, height * 0.60);
        path.lineTo(width * 0.52, height * 0.86);
        path.moveTo(width * 0.36, height * 0.48);
        path.lineTo(width * 0.36, height * 0.60);
        path.moveTo(width * 0.68, height * 0.48);
        path.lineTo(width * 0.68, height * 0.60);
        break;
      case 'Автомобил':
        path.moveTo(width * 0.18, height * 0.58);
        path.lineTo(width * 0.30, height * 0.38);
        path.lineTo(width * 0.70, height * 0.38);
        path.lineTo(width * 0.82, height * 0.58);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.18, height * 0.70);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.30, height * 0.80), width: width * 0.16, height: height * 0.16));
        path.addOval(Rect.fromCenter(center: Offset(width * 0.70, height * 0.80), width: width * 0.16, height: height * 0.16));
        path.moveTo(width * 0.46, height * 0.38);
        path.lineTo(width * 0.54, height * 0.38);
        break;
      case 'Камион':
        path.moveTo(width * 0.16, height * 0.60);
        path.lineTo(width * 0.16, height * 0.38);
        path.lineTo(width * 0.62, height * 0.38);
        path.lineTo(width * 0.76, height * 0.50);
        path.lineTo(width * 0.82, height * 0.50);
        path.lineTo(width * 0.82, height * 0.60);
        path.lineTo(width * 0.16, height * 0.60);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.30, height * 0.80), width: width * 0.16, height: height * 0.16));
        path.addOval(Rect.fromCenter(center: Offset(width * 0.68, height * 0.80), width: width * 0.16, height: height * 0.16));
        break;
      case 'Ван':
        path.moveTo(width * 0.18, height * 0.58);
        path.lineTo(width * 0.24, height * 0.36);
        path.lineTo(width * 0.66, height * 0.36);
        path.lineTo(width * 0.82, height * 0.58);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.18, height * 0.70);
        path.close();
        path.moveTo(width * 0.30, height * 0.36);
        path.lineTo(width * 0.30, height * 0.22);
        path.lineTo(width * 0.56, height * 0.22);
        path.lineTo(width * 0.56, height * 0.36);
        break;
      case 'Трактор':
        path.moveTo(width * 0.18, height * 0.58);
        path.lineTo(width * 0.24, height * 0.34);
        path.lineTo(width * 0.56, height * 0.34);
        path.lineTo(width * 0.82, height * 0.58);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.18, height * 0.70);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.28, height * 0.82), width: width * 0.18, height: height * 0.18));
        path.addOval(Rect.fromCenter(center: Offset(width * 0.72, height * 0.82), width: width * 0.18, height: height * 0.18));
        path.moveTo(width * 0.60, height * 0.34);
        path.lineTo(width * 0.60, height * 0.18);
        path.lineTo(width * 0.74, height * 0.18);
        break;
      case 'Пожарна кола':
        path.moveTo(width * 0.18, height * 0.58);
        path.lineTo(width * 0.24, height * 0.38);
        path.lineTo(width * 0.66, height * 0.38);
        path.lineTo(width * 0.82, height * 0.58);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.18, height * 0.70);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.30, height * 0.82), width: width * 0.16, height: height * 0.16));
        path.addOval(Rect.fromCenter(center: Offset(width * 0.70, height * 0.82), width: width * 0.16, height: height * 0.16));
        path.moveTo(width * 0.46, height * 0.38);
        path.lineTo(width * 0.54, height * 0.38);
        path.moveTo(width * 0.30, height * 0.58);
        path.lineTo(width * 0.30, height * 0.28);
        break;
      case 'Полицейски камион':
        path.moveTo(width * 0.18, height * 0.62);
        path.lineTo(width * 0.22, height * 0.40);
        path.lineTo(width * 0.68, height * 0.40);
        path.lineTo(width * 0.82, height * 0.62);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.18, height * 0.70);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.30, height * 0.82), width: width * 0.16, height: height * 0.16));
        path.addOval(Rect.fromCenter(center: Offset(width * 0.68, height * 0.82), width: width * 0.16, height: height * 0.16));
        path.moveTo(width * 0.40, height * 0.40);
        path.lineTo(width * 0.48, height * 0.28);
        path.lineTo(width * 0.60, height * 0.28);
        path.lineTo(width * 0.68, height * 0.40);
        break;
      case 'Къща':
        path.moveTo(width * 0.18, height * 0.72);
        path.lineTo(width * 0.52, height * 0.22);
        path.lineTo(width * 0.82, height * 0.72);
        path.lineTo(width * 0.82, height * 0.84);
        path.lineTo(width * 0.18, height * 0.84);
        path.close();
        path.moveTo(width * 0.28, height * 0.84);
        path.lineTo(width * 0.28, height * 0.56);
        path.lineTo(width * 0.46, height * 0.56);
        path.lineTo(width * 0.46, height * 0.84);
        path.moveTo(width * 0.54, height * 0.84);
        path.lineTo(width * 0.54, height * 0.56);
        path.lineTo(width * 0.72, height * 0.56);
        path.lineTo(width * 0.72, height * 0.84);
        path.moveTo(width * 0.60, height * 0.22);
        path.lineTo(width * 0.60, height * 0.08);
        path.lineTo(width * 0.72, height * 0.08);
        break;
      case 'Малка къща':
        path.moveTo(width * 0.22, height * 0.70);
        path.lineTo(width * 0.50, height * 0.36);
        path.lineTo(width * 0.78, height * 0.70);
        path.lineTo(width * 0.78, height * 0.84);
        path.lineTo(width * 0.22, height * 0.84);
        path.close();
        path.moveTo(width * 0.34, height * 0.84);
        path.lineTo(width * 0.34, height * 0.60);
        path.lineTo(width * 0.50, height * 0.60);
        path.lineTo(width * 0.50, height * 0.84);
        path.moveTo(width * 0.62, height * 0.84);
        path.lineTo(width * 0.62, height * 0.60);
        path.lineTo(width * 0.70, height * 0.60);
        break;
      case 'Вила':
        path.moveTo(width * 0.20, height * 0.72);
        path.lineTo(width * 0.50, height * 0.20);
        path.lineTo(width * 0.80, height * 0.72);
        path.lineTo(width * 0.80, height * 0.86);
        path.lineTo(width * 0.20, height * 0.86);
        path.close();
        path.moveTo(width * 0.50, height * 0.20);
        path.lineTo(width * 0.32, height * 0.36);
        path.lineTo(width * 0.68, height * 0.36);
        path.moveTo(width * 0.30, height * 0.86);
        path.lineTo(width * 0.30, height * 0.56);
        path.moveTo(width * 0.70, height * 0.86);
        path.lineTo(width * 0.70, height * 0.56);
        break;
      case 'Пързалка':
        path.moveTo(width * 0.24, height * 0.70);
        path.lineTo(width * 0.24, height * 0.42);
        path.lineTo(width * 0.72, height * 0.42);
        path.lineTo(width * 0.72, height * 0.70);
        path.moveTo(width * 0.36, height * 0.42);
        path.lineTo(width * 0.36, height * 0.18);
        path.moveTo(width * 0.60, height * 0.42);
        path.lineTo(width * 0.60, height * 0.18);
        path.moveTo(width * 0.24, height * 0.18);
        path.lineTo(width * 0.72, height * 0.18);
        break;
      case 'Параход':
        path.moveTo(width * 0.18, height * 0.60);
        path.lineTo(width * 0.38, height * 0.36);
        path.lineTo(width * 0.72, height * 0.36);
        path.lineTo(width * 0.82, height * 0.60);
        path.lineTo(width * 0.18, height * 0.60);
        path.close();
        path.moveTo(width * 0.52, height * 0.36);
        path.lineTo(width * 0.52, height * 0.18);
        path.lineTo(width * 0.62, height * 0.18);
        break;
      case 'Слънчев дом':
        path.moveTo(width * 0.18, height * 0.70);
        path.lineTo(width * 0.50, height * 0.24);
        path.lineTo(width * 0.82, height * 0.70);
        path.lineTo(width * 0.82, height * 0.84);
        path.lineTo(width * 0.18, height * 0.84);
        path.close();
        path.addOval(Rect.fromCenter(center: Offset(width * 0.22, height * 0.18), width: width * 0.16, height: height * 0.16));
        path.moveTo(width * 0.30, height * 0.84);
        path.lineTo(width * 0.30, height * 0.56);
        path.lineTo(width * 0.48, height * 0.56);
        path.lineTo(width * 0.48, height * 0.84);
        path.moveTo(width * 0.56, height * 0.84);
        path.lineTo(width * 0.56, height * 0.56);
        path.lineTo(width * 0.72, height * 0.56);
        path.lineTo(width * 0.72, height * 0.84);
        break;
      default:
        path.addOval(Rect.fromCenter(center: Offset(width * 0.52, height * 0.50), width: width * 0.46, height: height * 0.44));
        break;
    }

    return path;
  }

  Offset _pointAlongPath(double progress, Size size) {
    final List<Offset> points = switch (widget.lesson.title) {
      'Котка' => [
          Offset(size.width * 0.42, size.height * 0.28),
          Offset(size.width * 0.28, size.height * 0.14),
          Offset(size.width * 0.36, size.height * 0.34),
          Offset(size.width * 0.26, size.height * 0.72),
          Offset(size.width * 0.54, size.height * 0.68),
          Offset(size.width * 0.68, size.height * 0.52),
          Offset(size.width * 0.78, size.height * 0.72),
          Offset(size.width * 0.42, size.height * 0.28),
        ],
      'Куче' => [
          Offset(size.width * 0.30, size.height * 0.30),
          Offset(size.width * 0.18, size.height * 0.18),
          Offset(size.width * 0.24, size.height * 0.42),
          Offset(size.width * 0.42, size.height * 0.74),
          Offset(size.width * 0.60, size.height * 0.62),
          Offset(size.width * 0.72, size.height * 0.80),
          Offset(size.width * 0.74, size.height * 0.30),
          Offset(size.width * 0.86, size.height * 0.18),
          Offset(size.width * 0.30, size.height * 0.30),
        ],
      'Лисица' => [
          Offset(size.width * 0.48, size.height * 0.20),
          Offset(size.width * 0.30, size.height * 0.12),
          Offset(size.width * 0.22, size.height * 0.42),
          Offset(size.width * 0.42, size.height * 0.58),
          Offset(size.width * 0.52, size.height * 0.82),
          Offset(size.width * 0.58, size.height * 0.58),
          Offset(size.width * 0.78, size.height * 0.42),
          Offset(size.width * 0.70, size.height * 0.12),
          Offset(size.width * 0.48, size.height * 0.20),
        ],
      'Зайче' => [
          Offset(size.width * 0.26, size.height * 0.20),
          Offset(size.width * 0.18, size.height * 0.02),
          Offset(size.width * 0.34, size.height * 0.20),
          Offset(size.width * 0.34, size.height * 0.62),
          Offset(size.width * 0.28, size.height * 0.80),
          Offset(size.width * 0.66, size.height * 0.62),
          Offset(size.width * 0.72, size.height * 0.80),
          Offset(size.width * 0.74, size.height * 0.20),
          Offset(size.width * 0.82, size.height * 0.02),
          Offset(size.width * 0.26, size.height * 0.20),
        ],
      'Рибка' => [
          Offset(size.width * 0.20, size.height * 0.52),
          Offset(size.width * 0.38, size.height * 0.22),
          Offset(size.width * 0.56, size.height * 0.24),
          Offset(size.width * 0.86, size.height * 0.10),
          Offset(size.width * 0.84, size.height * 0.52),
          Offset(size.width * 0.56, size.height * 0.76),
          Offset(size.width * 0.20, size.height * 0.52),
        ],
      'Пингвин' => [
          Offset(size.width * 0.28, size.height * 0.56),
          Offset(size.width * 0.16, size.height * 0.68),
          Offset(size.width * 0.46, size.height * 0.72),
          Offset(size.width * 0.46, size.height * 0.86),
          Offset(size.width * 0.58, size.height * 0.72),
          Offset(size.width * 0.88, size.height * 0.68),
          Offset(size.width * 0.76, size.height * 0.56),
          Offset(size.width * 0.28, size.height * 0.56),
        ],
      'Слон' => [
          Offset(size.width * 0.22, size.height * 0.48),
          Offset(size.width * 0.10, size.height * 0.36),
          Offset(size.width * 0.20, size.height * 0.62),
          Offset(size.width * 0.52, size.height * 0.86),
          Offset(size.width * 0.68, size.height * 0.60),
          Offset(size.width * 0.94, size.height * 0.36),
          Offset(size.width * 0.82, size.height * 0.48),
          Offset(size.width * 0.22, size.height * 0.48),
        ],
      'Автомобил' => [
          Offset(size.width * 0.18, size.height * 0.58),
          Offset(size.width * 0.30, size.height * 0.38),
          Offset(size.width * 0.70, size.height * 0.38),
          Offset(size.width * 0.82, size.height * 0.58),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.58),
        ],
      'Камион' => [
          Offset(size.width * 0.16, size.height * 0.60),
          Offset(size.width * 0.16, size.height * 0.38),
          Offset(size.width * 0.62, size.height * 0.38),
          Offset(size.width * 0.76, size.height * 0.50),
          Offset(size.width * 0.82, size.height * 0.60),
          Offset(size.width * 0.16, size.height * 0.60),
        ],
      'Ван' => [
          Offset(size.width * 0.18, size.height * 0.58),
          Offset(size.width * 0.24, size.height * 0.36),
          Offset(size.width * 0.66, size.height * 0.36),
          Offset(size.width * 0.82, size.height * 0.58),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.58),
        ],
      'Трактор' => [
          Offset(size.width * 0.18, size.height * 0.58),
          Offset(size.width * 0.24, size.height * 0.34),
          Offset(size.width * 0.56, size.height * 0.34),
          Offset(size.width * 0.82, size.height * 0.58),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.58),
        ],
      'Пожарна кола' => [
          Offset(size.width * 0.18, size.height * 0.58),
          Offset(size.width * 0.24, size.height * 0.38),
          Offset(size.width * 0.66, size.height * 0.38),
          Offset(size.width * 0.82, size.height * 0.58),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.58),
        ],
      'Полицейски камион' => [
          Offset(size.width * 0.18, size.height * 0.62),
          Offset(size.width * 0.22, size.height * 0.40),
          Offset(size.width * 0.68, size.height * 0.40),
          Offset(size.width * 0.82, size.height * 0.62),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.18, size.height * 0.62),
        ],
      'Къща' => [
          Offset(size.width * 0.18, size.height * 0.72),
          Offset(size.width * 0.52, size.height * 0.22),
          Offset(size.width * 0.82, size.height * 0.72),
          Offset(size.width * 0.82, size.height * 0.84),
          Offset(size.width * 0.18, size.height * 0.84),
          Offset(size.width * 0.18, size.height * 0.72),
        ],
      'Малка къща' => [
          Offset(size.width * 0.22, size.height * 0.70),
          Offset(size.width * 0.50, size.height * 0.36),
          Offset(size.width * 0.78, size.height * 0.70),
          Offset(size.width * 0.78, size.height * 0.84),
          Offset(size.width * 0.22, size.height * 0.84),
          Offset(size.width * 0.22, size.height * 0.70),
        ],
      'Вила' => [
          Offset(size.width * 0.20, size.height * 0.72),
          Offset(size.width * 0.50, size.height * 0.20),
          Offset(size.width * 0.80, size.height * 0.72),
          Offset(size.width * 0.80, size.height * 0.86),
          Offset(size.width * 0.20, size.height * 0.86),
          Offset(size.width * 0.20, size.height * 0.72),
        ],
      'Пързалка' => [
          Offset(size.width * 0.24, size.height * 0.70),
          Offset(size.width * 0.24, size.height * 0.42),
          Offset(size.width * 0.36, size.height * 0.18),
          Offset(size.width * 0.60, size.height * 0.18),
          Offset(size.width * 0.72, size.height * 0.42),
          Offset(size.width * 0.72, size.height * 0.70),
          Offset(size.width * 0.24, size.height * 0.70),
        ],
      'Параход' => [
          Offset(size.width * 0.18, size.height * 0.60),
          Offset(size.width * 0.38, size.height * 0.36),
          Offset(size.width * 0.52, size.height * 0.18),
          Offset(size.width * 0.62, size.height * 0.18),
          Offset(size.width * 0.82, size.height * 0.60),
          Offset(size.width * 0.18, size.height * 0.60),
        ],
      'Слънчев дом' => [
          Offset(size.width * 0.18, size.height * 0.70),
          Offset(size.width * 0.50, size.height * 0.24),
          Offset(size.width * 0.82, size.height * 0.70),
          Offset(size.width * 0.82, size.height * 0.84),
          Offset(size.width * 0.18, size.height * 0.84),
          Offset(size.width * 0.18, size.height * 0.70),
        ],
      _ => [
          Offset(size.width * 0.34, size.height * 0.66),
          Offset(size.width * 0.22, size.height * 0.54),
          Offset(size.width * 0.22, size.height * 0.26),
          Offset(size.width * 0.46, size.height * 0.12),
          Offset(size.width * 0.60, size.height * 0.14),
          Offset(size.width * 0.68, size.height * 0.26),
          Offset(size.width * 0.72, size.height * 0.76),
          Offset(size.width * 0.54, size.height * 0.84),
          Offset(size.width * 0.38, size.height * 0.84),
          Offset(size.width * 0.22, size.height * 0.68),
          Offset(size.width * 0.34, size.height * 0.66),
        ],
    };

    if (points.length < 2) {
      return const Offset(0, 0);
    }

    final scaled = progress.clamp(0.0, 1.0) * (points.length - 1);
    final index = scaled.floor();
    final nextIndex = (index + 1).clamp(0, points.length - 1);
    final localProgress = scaled - index;
    final from = points[index];
    final to = points[nextIndex];

    return Offset(
      from.dx + (to.dx - from.dx) * localProgress,
      from.dy + (to.dy - from.dy) * localProgress,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width >= 960;
    final canvasHeight = isTablet ? 720.0 : 460.0;
    final canvasSize = Size(isTablet ? 540.0 : 360.0, canvasHeight - 26);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = Curves.easeInOutSine.transform(_controller.value);
        final path = _buildContourPath(canvasSize);
        final penPoint = _pointAlongPath(progress, canvasSize);
        final reveal = 0.05 + (progress * 0.95);
        final penX = penPoint.dx.clamp(16.0, canvasSize.width - 34.0);
        final penY = penPoint.dy.clamp(18.0, canvasSize.height - 30.0);

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.88, end: 1),
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFF4F6FB),
                  Color(0xFFFFFFFF),
                ],
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
                Text(
                  widget.lesson.category,
                  style: const TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF6C8DFF),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  height: canvasHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Colors.white.withValues(alpha: 0.58),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: const Color(0xFFF9FAFC),
                            border: Border.all(
                              color: const Color(0xFFE3E8F0),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(
                            painter: _TracePainter(
                              path: path,
                              progress: 1.0,
                              color: const Color(0xFFBFD0FF).withValues(alpha: 0.85),
                              strokeWidth: 4,
                            ),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: _RevealClip(path, reveal),
                        child: Transform.translate(
                          offset: const Offset(0, 0),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                            child: SvgPicture.asset(
                              widget.lesson.svgAsset,
                              width: isTablet ? 390 : 320,
                              height: isTablet ? 390 : 320,
                              fit: BoxFit.contain,
                              semanticsLabel: widget.lesson.title,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: penX - 18,
                        top: penY - 14,
                        child: Transform.rotate(
                          angle: -0.7 + (progress * 1.4),
                          child: Container(
                            padding: EdgeInsets.all(isTablet ? 12 : 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C8DFF).withValues(alpha: 0.96),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.brush_rounded,
                              color: Colors.white,
                              size: isTablet ? 28 : 24,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 18,
                        bottom: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7C9DFF).withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Рисувай ${widget.lesson.title.toLowerCase()}!',
                            style: const TextStyle(
                              color: Color(0xFF1F2A44),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(
                            painter: _TracePainter(
                              path: path,
                              progress: progress,
                              color: const Color(0xFF6C8DFF).withValues(alpha: 0.9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  widget.lesson.prompt,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2A44),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LessonGuideCard extends StatelessWidget {
  const _LessonGuideCard({required this.lesson});

  final DrawingLesson lesson;

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Стъпки за рисуване',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1F2A44),
            ),
          ),
          const SizedBox(height: 18),
          ...lesson.steps.map(
            (step) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(top: 2),
                    decoration: const BoxDecoration(
                      color: Color(0xFF7C9DFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '✓',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      step,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color(0xFF26314D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawingLesson {
  const DrawingLesson({
    required this.id,
    required this.category,
    required this.title,
    required this.emoji,
    required this.accent,
    required this.svgAsset,
    required this.prompt,
    required this.voiceText,
    required this.steps,
  });

  final int id;
  final String category;
  final String title;
  final String emoji;
  final Color accent;
  final String svgAsset;
  final String prompt;
  final String voiceText;
  final List<String> steps;
}
