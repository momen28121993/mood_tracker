import 'package:flutter/material.dart';

import '../models/mood_entry.dart';
import 'timeline_item.dart';

class AnimatedTimelineItem extends StatefulWidget {
  final MoodEntry entry;
  final Color color;

  const AnimatedTimelineItem({
    super.key,
    required this.entry,
    required this.color,
  });

  @override
  State<AnimatedTimelineItem> createState() => _AnimatedTimelineItemState();
}

class _AnimatedTimelineItemState extends State<AnimatedTimelineItem> {
  bool isTapped = false;

  void animateItem() {
    setState(() {
      isTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 160), () {
      if (!mounted) {
        return;
      }
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateItem,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        scale: isTapped ? 0.93 : 1,
        child: TimelineItem(entry: widget.entry, color: widget.color),
      ),
    );
  }
}
