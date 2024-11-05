import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_in_page_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_text_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_input_field.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_in.tr()),
      ),
      body: Consumer<SignInPageProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomInputField(
                  controller: provider.emailController,
                  label: LocaleKeys.email.tr(),
                  keyboardType: TextInputType.emailAddress,
                  errorMessage: provider.emailErrorMessage,
                  showErrorMessage: !provider.hasAnyEmptyField,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  controller: provider.passwordController,
                  label: LocaleKeys.password.tr(),
                  errorMessage: provider.passwordErrorMessage,
                  showErrorMessage: !provider.hasAnyEmptyField,
                  suffixIcon: GestureDetector(
                    onTap: provider.togglePasswordVisibility,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: provider.obscurePassword
                          ? SvgPicture.asset(Assets.svg.invisible.path)
                          : SvgPicture.asset(Assets.svg.visible.path),
                    ),
                  ),
                  obscureText: provider.obscurePassword,
                ),
                AppSpacing.vertical16,
                StandardTextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.forgotPassword),
                  text: LocaleKeys.forgot_password.tr(),
                ),
                AppSpacing.vertical16,
                StandardButton(
                  onPressed: () => provider.signInWithEmailAndPassword().then((hasSignedIn) {
                    if (hasSignedIn) Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
                  }),
                  text: LocaleKeys.login.tr(),
                  loading: provider.loading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
