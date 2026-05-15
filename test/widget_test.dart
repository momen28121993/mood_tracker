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
