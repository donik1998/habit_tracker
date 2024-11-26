import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/statistics_extension.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/state/completed_challenge_card.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';

class FinishedChallengePreview extends StatelessWidget {
  final ChallengeModel challenge;

  const FinishedChallengePreview({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: MediaQuery.viewPaddingOf(context).top),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close_rounded,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
          AppSpacing.vertical16,
          CompletedChallengeCard(
            stats: [
              CompletedChallengeStat(
                title: LocaleKeys.total_progress.tr(),
                value: '${challenge.completenessInPercent}%',
              ),
              CompletedChallengeStat(
                title: LocaleKeys.completed_days.tr(),
                value: '${challenge.daysCompleted}/21',
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: StandardButton.light(
              onPressed: () => Navigator.pop(context),
              text: LocaleKeys.go_to_main.tr(),
            ),
          ),
          AppSpacing.vertical10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: StandardButton(
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                AppRoutes.finishedChallengeDetails,
                arguments: challenge,
              ),
              text: LocaleKeys.review.tr(),
            ),
          ),
          AppSpacing.vertical24,
        ],
      ),
    );
  }
}
