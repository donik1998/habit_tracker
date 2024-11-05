import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/cards/profile_card.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/profile_menu_item.dart';
import 'package:habit_tracker/presentation/home/providers/profile_tab_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileTabProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: MediaQuery.paddingOf(context).top,
                      ),
                      ProfileCard(
                        name: provider.currentUser?.displayName ?? '',
                        email: provider.currentUser?.email ?? '',
                        avatarPath: provider.currentUser?.photoURL ?? '',
                        onEditProfile: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppSpacing.vertical8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.arrowTargetBold,
                    title: LocaleKeys.all_challenges.tr(),
                  ),
                  AppSpacing.vertical8,
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.lineChartUp,
                    title: LocaleKeys.finished_challenges.tr(),
                  ),
                  AppSpacing.vertical8,
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.playSquare,
                    title: LocaleKeys.tutorial.tr(),
                  ),
                  AppSpacing.vertical8,
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.translate,
                    title: LocaleKeys.language.tr(),
                  ),
                  AppSpacing.vertical8,
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.settings,
                    title: LocaleKeys.settings.tr(),
                  ),
                  AppSpacing.vertical8,
                  ProfileMenuItem(
                    onTap: () {},
                    icon: Assets.svg.logOut,
                    title: LocaleKeys.log_out.tr(),
                    color: AppColors.red800,
                  ),
                  AppSpacing.vertical8,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
