import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/challenge/challenge_details_tabs/daily_habits_tab.dart';
import 'package:habit_tracker/presentation/challenge/challenge_details_tabs/overall_habit_list.dart';
import 'package:habit_tracker/presentation/challenge/challenge_details_tabs/week_habits_list.dart';
import 'package:habit_tracker/presentation/challenge/providers/challenge_details_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/iconed_row_with_action.dart';
import 'package:habit_tracker/presentation/common_widgets/week_selector.dart';
import 'package:habit_tracker/presentation/common_widgets/wrappers/bottom_sheet_wrapper.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class ChallengeDetailsPage extends StatelessWidget {
  const ChallengeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Consumer<ChallengeDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.loading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            elevation: 2.5,
            shadowColor: Colors.black.withOpacity(0.25),
            automaticallyImplyLeading: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  provider.challenge.title,
                  style: textTheme?.boldTextTheme.typography3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                AppSpacing.vertical2,
                Text(
                  '${provider.challenge.progress}/21',
                  style: textTheme?.regularTextTheme.typography1
                      .copyWith(color: AppColors.textFieldText),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.35,
                    minHeight: MediaQuery.of(context).size.height * 0.175,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  builder: (_) => BottomSheetWrapper(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          IconedRowWithAction(
                            icon: SvgPicture.asset(
                              Assets.svg.arrowTargetBold.path,
                              color: AppColors.purple500,
                            ),
                            title: LocaleKeys.habits.tr(),
                            onTap: () => Navigator.pop(context),
                          ),
                          AppSpacing.vertical24,
                          IconedRowWithAction(
                            icon: SvgPicture.asset(
                              Assets.svg.informationOutlined.path,
                              color: AppColors.purple500,
                            ),
                            title: LocaleKeys.details.tr(),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, AppRoutes.challengeInfo,
                                      arguments: provider.challenge)
                                  .then((res) => provider.refreshChallenge());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                icon: SvgPicture.asset(Assets.svg.settings.path),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: provider.challenge.habits.isNotEmpty
                      ? CupertinoSlidingSegmentedControl<String>(
                          groupValue: provider.selectedHabitsDisplayingMode,
                          onValueChanged: provider.switchHabitsDisplayingMode,
                          children: {
                            ChallengeHabitsDisplayingMode.daily: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                LocaleKeys.daily.tr(),
                                style: textTheme?.regularTextTheme.typography3.copyWith(
                                  color: provider.selectedHabitsDisplayingMode ==
                                          ChallengeHabitsDisplayingMode.daily
                                      ? AppColors.purple500
                                      : null,
                                ),
                              ),
                            ),
                            ChallengeHabitsDisplayingMode.weekly: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                LocaleKeys.weekly.tr(),
                                style: textTheme?.regularTextTheme.typography3.copyWith(
                                  color: provider.selectedHabitsDisplayingMode ==
                                          ChallengeHabitsDisplayingMode.weekly
                                      ? AppColors.purple500
                                      : null,
                                ),
                              ),
                            ),
                            ChallengeHabitsDisplayingMode.overall: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                LocaleKeys.overall.tr(),
                                style: textTheme?.regularTextTheme.typography3.copyWith(
                                  color: provider.selectedHabitsDisplayingMode ==
                                          ChallengeHabitsDisplayingMode.overall
                                      ? AppColors.purple500
                                      : null,
                                ),
                              ),
                            ),
                          },
                        )
                      : Text(
                          LocaleKeys.challenge_starts_on.tr(
                            namedArgs: {
                              'date': DateFormat('dd MMMM', context.locale.languageCode)
                                  .format(provider.challenge.startDate)
                            },
                          ),
                          style: textTheme?.boldTextTheme.typography5,
                        ),
                ),
                const SliverToBoxAdapter(
                  child: AppSpacing.vertical16,
                ),
                if (provider.selectedHabitsDisplayingMode == ChallengeHabitsDisplayingMode.weekly &&
                    provider.challenge.habits.isNotEmpty)
                  SliverToBoxAdapter(
                    child: WeekSelector(
                      onWeekSelected: provider.selectWeek,
                    ),
                  ),
                if (provider.selectedHabitsDisplayingMode == ChallengeHabitsDisplayingMode.daily &&
                    provider.challenge.habits.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${LocaleKeys.today.tr()} ${DateFormat('dd MMMM', context.locale.languageCode).format(DateTime.now())}',
                          style: textTheme?.boldTextTheme.typography6,
                        ),
                        Text(
                          '${provider.challenge.startDate.difference(DateTime.now()).inDays.abs()}/21',
                          style: textTheme?.boldTextTheme.typography6,
                        ),
                      ],
                    ),
                  ),
                if (provider.selectedHabitsDisplayingMode ==
                        ChallengeHabitsDisplayingMode.overall &&
                    provider.challenge.habits.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Text(
                      plural(
                        LocaleKeys.you_are_ont_x_th_day,
                        provider.challenge.startDate.difference(DateTime.now()).inDays.abs(),
                      ),
                      style: textTheme?.boldTextTheme.typography6,
                    ),
                  ),
                const SliverToBoxAdapter(
                  child: AppSpacing.vertical16,
                ),
                SliverToBoxAdapter(
                  child: provider.selectedHabitsDisplayingMode ==
                          ChallengeHabitsDisplayingMode.daily
                      ? DailyHabitsTab(
                          notCompletedTodayHabits: provider.challenge.notCompletedTodayHabits,
                          completedTodayHabits: provider.challenge.completedTodayHabits,
                          onDone: (habit) => provider.markDailyProgress(
                            habitId: habit.id,
                            progress: HABIT_PROGRESS_NOT_DONE,
                            progressHabitId: habit.todayProgress.id,
                          ),
                          onHalfDone: (habit) => provider.markDailyProgress(
                            habitId: habit.id,
                            progress: HABIT_PROGRESS_HALF_DONE,
                            progressHabitId: habit.todayProgress.id,
                          ),
                          onNotDone: (habit) => provider.markDailyProgress(
                            habitId: habit.id,
                            progress: HABIT_PROGRESS_COMPLETED,
                            progressHabitId: habit.todayProgress.id,
                          ),
                        )
                      : provider.selectedHabitsDisplayingMode ==
                              ChallengeHabitsDisplayingMode.weekly
                          ? WeeklyTilesList(
                              selectedWeekNotifier: provider.selectedWeekNotifier,
                              habits: provider.challenge.habits,
                              onDone: (habitProgressId, habitId) => provider.markWeeklyProgress(
                                habitId: habitId,
                                habitProgressId: habitProgressId,
                                progress: HABIT_PROGRESS_COMPLETED,
                              ),
                              onHalfDone: (habitProgressId, habitId) => provider.markWeeklyProgress(
                                habitId: habitId,
                                habitProgressId: habitProgressId,
                                progress: HABIT_PROGRESS_HALF_DONE,
                              ),
                              onNotDone: (habitProgressId, habitId) => provider.markWeeklyProgress(
                                habitId: habitId,
                                habitProgressId: habitProgressId,
                                progress: HABIT_PROGRESS_NOT_DONE,
                              ),
                            )
                          : OverallTilesList(
                              habits: provider.challenge.habits,
                              onDone: (habitProgressId, habitId) => provider.markDailyProgress(
                                habitId: habitId,
                                progressHabitId: habitProgressId,
                                progress: HABIT_PROGRESS_COMPLETED,
                              ),
                              onHalfDone: (habitProgressId, habitId) => provider.markDailyProgress(
                                habitId: habitId,
                                progressHabitId: habitProgressId,
                                progress: HABIT_PROGRESS_HALF_DONE,
                              ),
                              onNotDone: (habitProgressId, habitId) => provider.markDailyProgress(
                                habitId: habitId,
                                progressHabitId: habitProgressId,
                                progress: HABIT_PROGRESS_NOT_DONE,
                              ),
                            ),
                ),
                if (provider.challenge.habits.isEmpty)
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.675,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset(
                            Assets.svg.arrowTarget.path,
                            color: AppColors.platinum400,
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          AppSpacing.vertical10,
                          Text(
                            LocaleKeys.no_habits_yet.tr(),
                            style: textTheme?.regularTextTheme.typography3
                                .copyWith(color: AppColors.platinum400),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.purple500,
            shape: const CircleBorder(),
            // onPressed: () => provider.refreshChallenge(),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.createHabit,
                    arguments: provider.challenge.id)
                .then((value) => provider.refreshChallenge()),
            child: SvgPicture.asset(Assets.svg.plus.path, color: Colors.white),
          ),
        );
      },
    );
  }
}
