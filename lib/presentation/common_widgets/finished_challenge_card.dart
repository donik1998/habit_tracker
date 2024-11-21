import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/statistics_extension.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/challenge_stat_widget.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class FinishedChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;

  const FinishedChallengeCard({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 48,
                height: 48,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: AppColors.purple50,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    challenge.iconPath,
                    color: AppColors.purple500,
                  ),
                ),
              ),
              AppSpacing.horizontal16,
              Expanded(
                child: Text(
                  challenge.title,
                  style: textTheme?.boldTextTheme.typography5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          AppSpacing.vertical16,
          Row(
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
          AppSpacing.vertical16,
          Text(
            '${LocaleKeys.start_date.tr()}: ${DateFormat('dd MMMM yyyy', Localizations.localeOf(context).languageCode).format(challenge.startDate)}',
            style: textTheme?.mediumTextTheme.typography1.copyWith(
              color: AppColors.platinum400,
            ),
          ),
          AppSpacing.vertical6,
          Text(
            '${LocaleKeys.end_date.tr()}: ${DateFormat('dd MMMM yyyy', Localizations.localeOf(context).languageCode).format(challenge.endDate)}',
            style: textTheme?.mediumTextTheme.typography1.copyWith(
              color: AppColors.platinum400,
            ),
          )
        ],
      ),
    );
  }
}
