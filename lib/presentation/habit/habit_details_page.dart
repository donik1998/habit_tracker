import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/habit_detailed_card.dart';
import 'package:habit_tracker/presentation/habit/provider/habit_details_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/info_manager.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class HabitDetailsPage extends StatelessWidget {
  const HabitDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;
    final habit = context.read<HabitDetailsProvider>().habit;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        title: RichText(
          textAlign: TextAlign.center,
          maxLines: 2,
          text: TextSpan(
            children: [
              TextSpan(
                text: habit.title,
                style: textTheme?.boldTextTheme.typography3,
              ),
              TextSpan(
                text: '\n${LocaleKeys.habit_details.tr()}',
                style: textTheme?.regularTextTheme.typography1,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.svg.moreVert.path),
          ),
        ],
      ),
      body: Consumer<HabitDetailsProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpacing.vertical8,
              HabitDetailedCard(
                habit: provider.habit,
                onProgressChanged: (progressId, progress) => provider
                    .editHabitProgress(progressId: progressId, progress: progress)
                    .then((successful) {
                  if (successful) {
                    InfoManager.showSuccessSnackBar(context, LocaleKeys.progress_saved.tr());
                  } else {
                    InfoManager.showErrorSnackBar(context, LocaleKeys.error_occurred.tr());
                  }
                  provider.updateHabit();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
