import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/challenge_card.dart';
import 'package:habit_tracker/presentation/common_widgets/home_page_tab_app_bar.dart';
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomePageTabAppBar(
          leading: SvgPicture.asset(Assets.svg.logoColored.path),
          trailing: SvgPicture.asset(Assets.svg.notificationBell.path),
        ),
        Expanded(
          child: Consumer<ChallengeTabProvider>(
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
                                LocaleKeys.your_challenges.tr(),
                                style: textTheme?.boldTextTheme.typography7,
                              ),
                            ),
                            StandardButton.light(
                              customHeight: MediaQuery.of(context).size.width * 0.2 * 0.45,
                              customWidth: MediaQuery.of(context).size.width * 0.2,
                              onPressed: () =>
                                  Navigator.pushNamed(context, AppRoutes.createChallenge),
                              text: '+ ${LocaleKeys.new_adj.tr()}',
                            ),
                          ],
                        ),
                        AppSpacing.vertical16,
                        if (snapshot.data == null || (snapshot.data?.isEmpty ?? false)) child!,
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 16),
                            itemBuilder: (context, index) => ChallengeCard(
                              challenge: snapshot.data![index],
                              onCardTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.challengeDetails,
                                arguments: snapshot.data![index].id,
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
            child: Align(
              alignment: Alignment.topCenter,
              child: MainScreenNoContentWidget(
                title: LocaleKeys.no_challenges_yet.tr(),
                description: LocaleKeys.challenges_tip.tr(),
                onTap: () => Navigator.pushNamed(context, AppRoutes.createChallenge),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
