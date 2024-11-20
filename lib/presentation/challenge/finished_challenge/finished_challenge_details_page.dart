import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/statistics_extension.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/habit_detailed_card.dart';
import 'package:habit_tracker/presentation/common_widgets/challenge_stat_widget.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class FinishedChallengeDetailsPage extends StatelessWidget {
  final ChallengeModel challenge;

  const FinishedChallengeDetailsPage({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        automaticallyImplyLeading: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              challenge.title,
              style: textTheme?.boldTextTheme.typography3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vertical2,
            Text(
              LocaleKeys.challenges_tab.tr(),
              style: textTheme?.regularTextTheme.typography1.copyWith(
                color: AppColors.textFieldText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                LocaleKeys.completed_challenge_message.tr(),
                style: textTheme?.boldTextTheme.typography4,
              ),
            ),
            const SliverToBoxAdapter(
              child: AppSpacing.vertical24,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ChallengeStatWidget(
                      title: LocaleKeys.total_progress.tr(),
                      value: '${challenge.completenessInPercent}%',
                    ),
                  ),
                  AppSpacing.horizontal16,
                  Expanded(
                    child: ChallengeStatWidget(
                      title: LocaleKeys.completed_days.tr(),
                      value: '${challenge.daysCompleted}/21',
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: AppSpacing.vertical24,
            ),
            SliverToBoxAdapter(
              child: Text(
                LocaleKeys.review.tr(),
                style: textTheme?.boldTextTheme.typography4,
              ),
            ),
            const SliverToBoxAdapter(
              child: AppSpacing.vertical24,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => HabitDetailedCard(
                  habit: challenge.habits.elementAt(index),
                  showDates: false,
                ),
                childCount: challenge.habits.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
