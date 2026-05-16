import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:mood_tracker/core/constant/app_strings.dart';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/models/mood_entry.dart';
import 'package:mood_tracker/providers/mood_provider.dart';

void main() {
  test('MoodProvider keeps latest seven moods', () {
    final moodProvider = MoodProvider();

    for (int i = 0; i < 9; i++) {
      moodProvider.addMood(MoodType.happy);
    }

    expect(moodProvider.entries.length, 7);
  });

  test('MoodProvider places the newest mood first', () {
    final moodProvider = MoodProvider();

    moodProvider.addMood(MoodType.sad);
    moodProvider.addMood(MoodType.neutral);
    moodProvider.addMood(MoodType.happy);

    expect(moodProvider.entries.first.mood, MoodType.happy);
    expect(moodProvider.entries.last.mood, MoodType.sad);
  });

  test('MoodProvider drops the oldest mood when the cap is exceeded', () {
    final moodProvider = MoodProvider();

    moodProvider.addMood(MoodType.sad);
    for (int i = 0; i < 7; i++) {
      moodProvider.addMood(MoodType.happy);
    }

    expect(moodProvider.entries.length, 7);
    expect(
      moodProvider.entries.any((entry) => entry.mood == MoodType.sad),
      isFalse,
    );
  });

  test('MoodProvider notifies listeners when a mood is added', () {
    final moodProvider = MoodProvider();
    int notifyCount = 0;
    moodProvider.addListener(() => notifyCount++);

    moodProvider.addMood(MoodType.happy);
    moodProvider.addMood(MoodType.neutral);

    expect(notifyCount, 2);
  });

  testWidgets('Mood can be added to the timeline', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => MoodProvider(),
        child: const MyApp(),
      ),
    );

    expect(find.text(AppStrings.noMoods), findsOneWidget);
    expect(find.text('0/7'), findsOneWidget);

    await tester.tap(find.text(AppStrings.happy));
    await tester.pump();

    expect(find.text(AppStrings.noMoods), findsNothing);
    expect(find.text('1/7'), findsOneWidget);
  });
}
