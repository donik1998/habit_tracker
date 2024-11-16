import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/home_page_tab_app_bar.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/common_widgets/state/no_challenges_widget.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/challenge_habit_tile.dart';
import 'package:habit_tracker/presentation/home/providers/habits_tab_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class HabitsTab extends StatelessWidget {
  const HabitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomePageTabAppBar(
          leading: Text(
            LocaleKeys.habits_tab.tr(),
            style: textTheme?.boldTextTheme.typography5,
          ),
          trailing: StandardButton.light(
            customWidth: MediaQuery.of(context).size.width * 0.4,
            customHeight: MediaQuery.of(context).size.width * 0.4 * 0.275,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.createHabit),
            text: '+ ${LocaleKeys.new_habit.tr()}',
          ),
        ),
        Expanded(
          child: Consumer<HabitsTabProvider>(
            builder: (context, provider, child) {
              return StreamBuilder(
                stream: provider.habitsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Loader());
                  }
                  if (snapshot.data == null || (snapshot.data?.isEmpty ?? false)) {
                    return Column(children: [child!]);
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (context, index) => AppSpacing.vertical16,
                    itemBuilder: (context, index) => ChallengeHabitTile(
                      habit: snapshot.data!.elementAt(index),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.habitDetails,
                        arguments: snapshot.data!.elementAt(index),
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                  );
                },
              );
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MainScreenNoContentWidget(
                  buttonText: LocaleKeys.create.tr(),
                  title: LocaleKeys.no_habits_yet.tr(),
                  description: LocaleKeys.habits_description.tr(),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.createHabit),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
