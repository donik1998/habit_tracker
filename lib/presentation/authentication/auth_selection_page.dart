import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class AuthSelectionPage extends StatelessWidget {
  const AuthSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.customTextTheme?.boldTextTheme;
    final regularTextTheme = context.customTextTheme?.regularTextTheme;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.svg.logoColored.path,
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: MediaQuery.of(context).size.width * 0.37 * 0.22,
                ),
                AppSpacing.vertical72,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    LocaleKeys.auth_selection_page_title.tr(),
                    style: boldTextTheme?.typography7,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    LocaleKeys.auth_selection_page_subtitle.tr(),
                    style: regularTextTheme?.typography3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StandardButton(
                    text: LocaleKeys.get_started.tr(),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.signUp),
                  ),
                  AppSpacing.vertical16,
                  Text(
                    LocaleKeys.already_have_an_account.tr(),
                    style: regularTextTheme?.typography2.copyWith(color: AppColors.textFieldText),
                  ),
                  AppSpacing.vertical16,
                  StandardButton.light(
                    text: LocaleKeys.sign_in.tr(),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.signIn),
                  ),
                  AppSpacing.vertical16,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
