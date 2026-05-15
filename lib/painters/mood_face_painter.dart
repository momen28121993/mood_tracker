import 'dart:math';

import 'package:flutter/material.dart';

import '../models/mood_entry.dart';

class MoodFacePainter extends CustomPainter {
  final MoodType mood;
  final Color color;

  MoodFacePainter({required this.mood, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;

    final facePaint = Paint()
      ..color = color.withValues(alpha: 0.16)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = color
      ..strokeWidth = radius * 0.08
      ..style = PaintingStyle.stroke;

    final detailPaint = Paint()
      ..color = color
      ..strokeWidth = radius * 0.08
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final eyePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.9, facePaint);
    canvas.drawCircle(center, radius * 0.9, borderPaint);

    _drawEyes(canvas, size, eyePaint);
    _drawBrows(canvas, size, detailPaint);
    _drawMouth(canvas, size, detailPaint);
  }

  void _drawEyes(Canvas canvas, Size size, Paint paint) {
    final eyeRadius = size.shortestSide * 0.045;
    final y = size.height * 0.4;

    canvas.drawCircle(Offset(size.width * 0.38, y), eyeRadius, paint);
    canvas.drawCircle(Offset(size.width * 0.62, y), eyeRadius, paint);
  }

  void _drawBrows(Canvas canvas, Size size, Paint paint) {
    final leftStart = Offset(size.width * 0.3, size.height * 0.29);
    final leftEnd = Offset(size.width * 0.45, size.height * 0.31);
    final rightStart = Offset(size.width * 0.55, size.height * 0.31);
    final rightEnd = Offset(size.width * 0.7, size.height * 0.29);

    if (mood == MoodType.sad) {
      canvas.drawLine(
        Offset(size.width * 0.3, size.height * 0.27),
        Offset(size.width * 0.45, size.height * 0.34),
        paint,
      );
      canvas.drawLine(
        Offset(size.width * 0.55, size.height * 0.34),
        Offset(size.width * 0.7, size.height * 0.27),
        paint,
      );
      return;
    }

    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }

  void _drawMouth(Canvas canvas, Size size, Paint paint) {
    if (mood == MoodType.neutral) {
      canvas.drawLine(
        Offset(size.width * 0.34, size.height * 0.65),
        Offset(size.width * 0.66, size.height * 0.65),
        paint,
      );
      return;
    }

    final mouthRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.58),
      width: size.width * 0.4,
      height: size.height * 0.28,
    );

    if (mood == MoodType.happy) {
      canvas.drawArc(mouthRect, 0.15, pi - 0.3, false, paint);
    } else {
      canvas.drawArc(mouthRect, pi + 0.15, pi - 0.3, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MoodFacePainter oldDelegate) {
    return oldDelegate.mood != mood || oldDelegate.color != color;
  }
}
