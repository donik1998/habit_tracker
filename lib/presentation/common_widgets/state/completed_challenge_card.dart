import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/challenge_stat_widget.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class CompletedChallengeCard extends StatelessWidget {
  final List<CompletedChallengeStat> stats;

  const CompletedChallengeCard({
    super.key,
    required this.stats,
  });

  final double margin = 16.0;
  final double padding = 12.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width - (2 * margin),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.35 * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: AppColors.grey50,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          LocaleKeys.finished_challenge_text.tr(),
                          style: textTheme?.boldTextTheme.typography4,
                          textAlign: TextAlign.center,
                        ),
                        AppSpacing.vertical16,
                        Wrap(
                          spacing: margin,
                          runSpacing: margin,
                          children: stats
                              .map(
                                (stat) => ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: (MediaQuery.sizeOf(context).width -
                                            padding -
                                            (2 * margin) -
                                            (2 * padding)) /
                                        2,
                                  ),
                                  child: ChallengeStatWidget(
                                    title: stat.title,
                                    value: stat.value,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: (MediaQuery.sizeOf(context).height * 0.35) / 3,
                height: (MediaQuery.sizeOf(context).height * 0.35) / 3,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey50,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.svg.throphy.path,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedChallengeStat {
  final String title;
  final String value;

  CompletedChallengeStat({
    required this.title,
    required this.value,
  });
}
