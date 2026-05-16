import 'package:flutter/material.dart';

import '../models/mood_entry.dart';
import '../painters/mood_face_painter.dart';

class MoodFaceWidget extends StatelessWidget {
  final MoodType mood;
  final Color color;
  final double size;

  const MoodFaceWidget({
    super.key,
    required this.mood,
    required this.color,
    this.size = 74,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CustomPaint(
        painter: MoodFacePainter(mood: mood, color: color),
      ),
    );
  }
}
