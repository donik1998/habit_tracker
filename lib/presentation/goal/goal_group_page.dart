import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/goal_input_widget.dart';
import 'package:habit_tracker/presentation/goal/providers/goals_group_page_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class GoalsGroupPage extends StatelessWidget {
  const GoalsGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GoalsGroupPageProvider>();
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        automaticallyImplyLeading: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: provider.groupModel.name,
                style: textTheme?.boldTextTheme.typography3,
              ),
              TextSpan(
                text: '\n${LocaleKeys.goals_tab.tr()}',
                style: textTheme?.regularTextTheme.typography1
                    .copyWith(color: AppColors.textFieldText),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () => provider.toggleEditingMode(),
            icon: SvgPicture.asset(Assets.svg.editPencil.path),
          ),
        ],
      ),
      body: Consumer<GoalsGroupPageProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              if (index == provider.groupModel.goals.length) {
                return GoalInputWidget(
                  selected: false,
                  label: LocaleKeys.new_goal.tr(),
                  controller: provider.newGoalTextController,
                  onEditingComplete: () => provider.debouncer.run(() => provider.saveNewGoal()),
                );
              }
              final goal = provider.groupModel.goals.elementAt(index);
              return GoalInputWidget(
                label: 'Goal ${index + 1}',
                controller: provider.goalTextControllers[goal.id]!,
                selected: goal.isCompleted,
                onChangedDoneStatus: (value) => provider.editGoal(
                  goalId: goal.id,
                  done: value,
                ),
                onEditingComplete: () => provider.editGoal(
                  goalId: goal.id,
                  newDescription: provider.goalTextControllers[goal.id]!.text,
                ),
              );
            },
            separatorBuilder: (context, index) => AppSpacing.vertical16,
            itemCount: provider.groupModel.goals.length + 1,
          );
        },
      ),
    );
  }
}
