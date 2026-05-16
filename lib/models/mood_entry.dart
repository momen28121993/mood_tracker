enum MoodType { happy, neutral, sad }

class MoodEntry {
  final MoodType mood;
  final DateTime date;

  const MoodEntry({required this.mood, required this.date});
}
