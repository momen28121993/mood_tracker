import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constant/app_color.dart';
import '../core/constant/app_strings.dart';
import '../models/mood_entry.dart';
import '../providers/mood_provider.dart';
import '../widgets/animated_timeline_item.dart';
import '../widgets/mood_selector_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.appName,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppStrings.homeDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 620;

                        return GridView.count(
                          crossAxisCount: isMobile ? 1 : 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: isMobile ? 2 : 1,
                          children: [
                            MoodSelectorCard(
                              mood: MoodType.happy,
                              title: AppStrings.happy,
                              color: AppColor.happy,
                              onTap: () {
                                context.read<MoodProvider>().addMood(
                                  MoodType.happy,
                                );
                              },
                            ),
                            MoodSelectorCard(
                              mood: MoodType.neutral,
                              title: AppStrings.neutral,
                              color: AppColor.neutral,
                              onTap: () {
                                context.read<MoodProvider>().addMood(
                                  MoodType.neutral,
                                );
                              },
                            ),
                            MoodSelectorCard(
                              mood: MoodType.sad,
                              title: AppStrings.sad,
                              color: AppColor.sad,
                              onTap: () {
                                context.read<MoodProvider>().addMood(
                                  MoodType.sad,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.latestMoods,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Consumer<MoodProvider>(
                          builder: (context, moodProvider, child) {
                            return Text(
                              '${moodProvider.entries.length}/7',
                              style: Theme.of(context).textTheme.bodyMedium,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: Consumer<MoodProvider>(
                        builder: (context, moodProvider, child) {
                          if (moodProvider.entries.isEmpty) {
                            return Center(
                              child: Text(
                                AppStrings.noMoods,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: moodProvider.entries.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 16);
                            },
                            itemBuilder: (context, index) {
                              final entry = moodProvider.entries[index];

                              return AnimatedTimelineItem(
                                entry: entry,
                                color: getMoodColor(entry.mood),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getMoodColor(MoodType mood) {
    if (mood == MoodType.happy) {
      return AppColor.happy;
    } else if (mood == MoodType.neutral) {
      return AppColor.neutral;
    } else {
      return AppColor.sad;
    }
  }
}
