import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mood_entry.dart';
import 'mood_face_widget.dart';

class TimelineItem extends StatelessWidget {
  final MoodEntry entry;
  final Color color;

  const TimelineItem({super.key, required this.entry, required this.color});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MMM d').format(entry.date);
    final time = DateFormat('h:mm a').format(entry.date);

    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: color, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 12),
          MoodFaceWidget(mood: entry.mood, color: color, size: 58),
        ],
      ),
    );
  }
}
