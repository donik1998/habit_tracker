import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/authentication/providers/forgot_password_page_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_input_field.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.forgot_password.tr()),
      ),
      body: Consumer<ForgotPasswordPageProvider>(
        builder: (context, provider, child) {
          if (provider.hasSentLink) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      LocaleKeys.verification_link_sent.tr(),
                      style: textTheme?.regularTextTheme.typography2,
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.vertical16,
                    StandardButton(
                      onPressed: () => Navigator.pop(context),
                      text: LocaleKeys.back_to_login.tr(),
                    ),
                  ],
                ),
              ),
            );
          }
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
                Text(
                  LocaleKeys.forgot_password_hint.tr(),
                  style: textTheme?.regularTextTheme.typography2.copyWith(color: AppColors.textFieldText),
                ),
                AppSpacing.vertical16,
                StandardButton(
                  disabled: !provider.isFormValid,
                  onPressed: provider.sendVerificationLink,
                  text: LocaleKeys.define_new_password.tr(),
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
