import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/challenge/providers/challenge_info_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standard_outlined_button.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class ChallengeInfoPage extends StatelessWidget {
  const ChallengeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.25),
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.challenge_details.tr()),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.svg.close.path),
          ),
        ],
      ),
      body: Consumer<ChallengeInfoProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  LocaleKeys.icon.tr(),
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.textFieldText),
                ),
                AppSpacing.vertical12,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.125,
                    height: MediaQuery.of(context).size.width * 0.125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.purple100,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        provider.challenge.iconPath,
                        color: AppColors.purple500,
                      ),
                    ),
                  ),
                ),
                AppSpacing.vertical16,
                Text(
                  LocaleKeys.title.tr(),
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.textFieldText),
                ),
                Text(
                  provider.challenge.title,
                  style: textTheme?.mediumTextTheme.typography3,
                ),
                AppSpacing.vertical16,
                Text(
                  LocaleKeys.duration.tr(),
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.textFieldText),
                ),
                Text(
                  provider.challenge.duration.toString(),
                  style: textTheme?.mediumTextTheme.typography3,
                ),
                AppSpacing.vertical16,
                Text(
                  LocaleKeys.start_date.tr(),
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.textFieldText),
                ),
                Text(
                  DateFormat('dd/MM/yyyy', context.locale.languageCode).format(provider.challenge.startDate),
                  style: textTheme?.mediumTextTheme.typography3,
                ),
                AppSpacing.vertical16,
                Align(
                  alignment: Alignment.centerLeft,
                  child: StandardOutlinedButton(
                    onPressed: () => provider.deleteChallenge().then(
                          (hasDeleted) => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false),
                        ),
                    text: LocaleKeys.delete.tr(),
                    loading: provider.loading,
                    borderColor: AppColors.red100,
                    textColor: AppColors.red800,
                    customWidth: MediaQuery.of(context).size.width * 0.25,
                    customHeight: 56,
                  ),
                ),
                const Spacer(),
                StandardOutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.editChallenge, arguments: provider.challenge)
                      .then((res) => provider.reloadChallenge()),
                  text: LocaleKeys.edit.tr(),
                  loading: false,
                ),
                AppSpacing.vertical16,
              ],
            ),
          );
        },
      ),
    );
  }
}
