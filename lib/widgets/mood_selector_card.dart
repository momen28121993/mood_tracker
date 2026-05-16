import 'package:flutter/material.dart';

import '../models/mood_entry.dart';
import 'mood_face_widget.dart';

class MoodSelectorCard extends StatefulWidget {
  final MoodType mood;
  final String title;
  final Color color;
  final void Function()? onTap;

  const MoodSelectorCard({
    super.key,
    required this.mood,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  State<MoodSelectorCard> createState() => _MoodSelectorCardState();
}

class _MoodSelectorCardState extends State<MoodSelectorCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: isHover ? 1.03 : 1,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            decoration: BoxDecoration(
              color: isHover
                  ? widget.color.withValues(alpha: 0.10)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: widget.color.withValues(alpha: isHover ? 0.8 : 0.22),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MoodFaceWidget(mood: widget.mood, color: widget.color),
                const SizedBox(height: 14),
                Text(
                  widget.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: widget.color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
