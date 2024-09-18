import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_up_page_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_input_field.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/iconed_list_item.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.sign_up.tr(),
        ),
      ),
      body: Consumer<SignUpPageProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.vertical16,
                CustomInputField(
                  controller: provider.firstNameController,
                  label: LocaleKeys.first_name.tr(),
                  errorMessage: provider.firstNameFieldErrorMessage,
                  showErrorMessage: !provider.hasAnyEmptyField,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  controller: provider.lastNameController,
                  label: LocaleKeys.last_name.tr(),
                  errorMessage: provider.lastNameFieldErrorMessage,
                  showErrorMessage: !provider.hasAnyEmptyField,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  controller: provider.emailController,
                  label: LocaleKeys.email.tr(),
                  keyboardType: TextInputType.emailAddress,
                  errorMessage: provider.emailFieldErrorMessage,
                  showErrorMessage: !provider.hasAnyEmptyField,
                ),
                AppSpacing.vertical16,
                Text(
                  LocaleKeys.email_tip.tr(),
                  style: textTheme?.regularTextTheme.typography3.copyWith(
                    color: AppColors.textFieldText,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  controller: provider.passwordController,
                  label: LocaleKeys.password.tr(),
                  suffixIcon: GestureDetector(
                    onTap: provider.togglePasswordVisibility,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: provider.obscurePassword
                          ? SvgPicture.asset(Assets.svg.invisible.path)
                          : SvgPicture.asset(Assets.svg.visible.path),
                    ),
                  ),
                  showErrorMessage: false,
                  obscureText: provider.obscurePassword,
                ),
                AppSpacing.vertical16,
                IconedListItem(
                  icon: SvgPicture.asset(
                    Assets.svg.information.path,
                    color: provider.passwordStrengthColor,
                  ),
                  title: LocaleKeys.password_strength.tr(
                    namedArgs: {'strength': provider.passwordStrength.tr()},
                  ),
                ),
                AppSpacing.vertical16,
                IconedListItem(
                  icon: SvgPicture.asset(
                    provider.passwordHasEnoughCharacters ? Assets.svg.check.path : Assets.svg.cross.path,
                  ),
                  title: LocaleKeys.password_feature_1.tr(),
                ),
                AppSpacing.vertical16,
                IconedListItem(
                  icon: SvgPicture.asset(
                    !provider.hasNameOrEmailInPassword ? Assets.svg.check.path : Assets.svg.cross.path,
                  ),
                  title: LocaleKeys.password_feature_2.tr(),
                ),
                AppSpacing.vertical16,
                IconedListItem(
                  icon: SvgPicture.asset(
                    provider.passwordHasAnySymbolAndNumber ? Assets.svg.check.path : Assets.svg.cross.path,
                  ),
                  title: LocaleKeys.password_feature_3.tr(),
                ),
                AppSpacing.vertical16,
                IconedListItem(
                  icon: SvgPicture.asset(
                    provider.passwordHaveWhiteSpaces ? Assets.svg.check.path : Assets.svg.cross.path,
                  ),
                  title: LocaleKeys.password_feature_4.tr(),
                ),
                const Spacer(),
                StandardButton(
                  loading: provider.loading,
                  disabled: !provider.isFormValid,
                  onPressed: () => provider.signUp().then(
                    (hasLoggedIn) {
                      if (hasLoggedIn) {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      }
                    },
                  ),
                  text: LocaleKeys.sign_up.tr(),
                ),
                AppSpacing.vertical24,
              ],
            ),
          );
        },
      ),
    );
  }
}
