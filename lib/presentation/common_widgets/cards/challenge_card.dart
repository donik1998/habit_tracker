import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/stat_card.dart';
import 'package:habit_tracker/presentation/common_widgets/progress_bar_with_right_hint.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;
  final VoidCallback? onCardTap;

  const ChallengeCard({
    Key? key,
    required this.challenge,
    this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onCardTap,
        child: Ink(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width - 32,
          height: (MediaQuery.of(context).size.width - 32) * 0.675,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.purple100,
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
                      style: textTheme?.boldTextTheme.typography5.copyWith(
                        color: AppColors.platinum900,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical16,
              Ink(
                height: MediaQuery.of(context).size.width * 0.4 * 0.5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: StatCard(
                        title: LocaleKeys.habits.tr(),
                        value: challenge.habits.length.toString(),
                      ),
                    ),
                    AppSpacing.horizontal16,
                    Expanded(
                      child: StatCard(
                        title: LocaleKeys.duration.tr(),
                        value: LocaleKeys.days.plural(challenge.duration),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical16,
              Text(
                LocaleKeys.start_date_with_date.tr(namedArgs: {
                  'date': DateFormat('dd MMMM', context.locale.languageCode).format(challenge.startDate),
                }),
                style: textTheme?.regularTextTheme.typography3.copyWith(color: AppColors.textFieldText),
              ),
              AppSpacing.vertical12,
              ProgressBarWithRightHint(
                progress: challenge.progress,
                maxProgress: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
