import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/home/providers/challenges_tab_page.dart';
import 'package:habit_tracker/presentation/home/providers/goal_tab_provider.dart';
import 'package:habit_tracker/presentation/home/providers/habits_tab_provider.dart';
import 'package:habit_tracker/presentation/home/providers/home_page_provider.dart';
import 'package:habit_tracker/presentation/home/providers/profile_tab_provider.dart';
import 'package:habit_tracker/presentation/home/tabs/challenges_tab.dart';
import 'package:habit_tracker/presentation/home/tabs/goals_tab.dart';
import 'package:habit_tracker/presentation/home/tabs/habits_tab.dart';
import 'package:habit_tracker/presentation/home/tabs/profile_tab.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    ChangeNotifierProvider(
      create: (_) => HabitsTabProvider(),
      child: const HabitsTab(),
    ),
    ChangeNotifierProvider(
      create: (_) => GoalsTabProvider(),
      child: const GoalsTab(),
    ),
    ChangeNotifierProvider(
      create: (_) => ChallengeTabProvider(),
      child: const ChallengesTab(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProfileTabProvider(),
      child: const ProfileTab(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customScaffold,
      body: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return PageView(
            controller: provider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          final selectedItemColor = Theme.of(context).bottomNavigationBarTheme.selectedItemColor;
          final unselectedItemColor =
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
          return Container(
            padding: const EdgeInsets.only(top: 8),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              border: Border.all(color: AppColors.borderStandard, width: 1),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: provider.currentIndex,
                onTap: provider.onTabChanged,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.svg.habitsTab.path,
                      color: provider.currentIndex == 0 ? selectedItemColor : unselectedItemColor,
                    ),
                    label: LocaleKeys.habits_tab.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.svg.goalsTab.path,
                      color: provider.currentIndex == 1 ? selectedItemColor : unselectedItemColor,
                    ),
                    label: LocaleKeys.goals_tab.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.svg.challengeTab.path,
                      color: provider.currentIndex == 2 ? selectedItemColor : unselectedItemColor,
                    ),
                    label: LocaleKeys.challenges_tab.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.svg.profileTab.path,
                      color: provider.currentIndex == 3 ? selectedItemColor : unselectedItemColor,
                    ),
                    label: LocaleKeys.profile_tab.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
