import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/challenge_card.dart';
import 'package:habit_tracker/presentation/common_widgets/loader.dart';
import 'package:habit_tracker/presentation/common_widgets/state/no_challenges_widget.dart';
import 'package:habit_tracker/presentation/home/providers/challenges_tab_page.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class ChallengesTab extends StatelessWidget {
  const ChallengesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Consumer<ChallengeTabProvider>(
      builder: (context, provider, child) {
        return StreamBuilder<List<ChallengeModel>>(
          stream: provider.challengesStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Loader());
            }
            return Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your challenges',
                          style: textTheme?.boldTextTheme.typography7,
                        ),
                      ),
                      StandardButton.light(
                        customHeight: MediaQuery.of(context).size.width * 0.2 * 0.45,
                        customWidth: MediaQuery.of(context).size.width * 0.2,
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.createChallenge),
                        text: '+ ${LocaleKeys.new_adj.tr()}',
                      ),
                    ],
                  ),
                  AppSpacing.vertical16,
                  if (snapshot.data == null || (snapshot.data?.isEmpty ?? false))
                    Align(
                      alignment: Alignment.topCenter,
                      child: NoChallengesWidget(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.createChallenge),
                      ),
                    ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => ChallengeCard(
                        challenge: snapshot.data![index],
                        onCardTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.challengeDetails,
                          arguments: snapshot.data![index],
                        ),
                      ),
                      separatorBuilder: (context, index) => AppSpacing.vertical16,
                      itemCount: snapshot.data?.length ?? 0,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
