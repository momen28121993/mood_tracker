import 'package:flutter/material.dart';

import '../models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  final List<MoodEntry> _entries = [];

  List<MoodEntry> get entries => List.unmodifiable(_entries);

  void addMood(MoodType mood) {
    _entries.insert(0, MoodEntry(mood: mood, date: DateTime.now()));

    if (_entries.length > 7) {
      _entries.removeLast();
    }

    notifyListeners();
  }
}
