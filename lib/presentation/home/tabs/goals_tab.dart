import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/goal_group_widget.dart';
import 'package:habit_tracker/presentation/common_widgets/home_page_tab_app_bar.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/common_widgets/state/no_challenges_widget.dart';
import 'package:habit_tracker/presentation/home/providers/goal_tab_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class GoalsTab extends StatelessWidget {
  const GoalsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomePageTabAppBar(
          leading: Text(
            LocaleKeys.goals_tab.tr(),
            style: textTheme?.boldTextTheme.typography5,
          ),
          trailing: StandardButton.light(
            customWidth: MediaQuery.of(context).size.width * 0.335,
            customHeight: MediaQuery.of(context).size.width * 0.335 * 0.275,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.createGoalGroup),
            text: '+ ${LocaleKeys.new_group.tr()}',
          ),
        ),
        Expanded(
          child: Consumer<GoalsTabProvider>(
            builder: (context, provider, child) {
              return StreamBuilder<List<GoalGroupModel>>(
                stream: provider.goalsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Loader());
                  }
                  if (snapshot.data == null || (snapshot.data?.isEmpty ?? false)) {
                    return Column(children: [child!]);
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final goalGroup = snapshot.data!.elementAt(index);

                      return GoalGroupWidget(
                        goalGroup: goalGroup,
                        onDone: () => provider.refreshGoals(),
                      );
                    },
                    separatorBuilder: (context, index) => AppSpacing.vertical16,
                    itemCount: snapshot.data?.length ?? 0,
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
                  title: LocaleKeys.no_goals_yet.tr(),
                  description: LocaleKeys.goals_description.tr(),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.createGoalGroup),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
