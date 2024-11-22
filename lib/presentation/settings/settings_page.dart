import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/settings/provider/settings_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        automaticallyImplyLeading: true,
        title: Text(
          LocaleKeys.settings.tr(),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpacing.vertical16,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.push_notifications.tr(),
                      style: textTheme?.mediumTextTheme.typography3,
                    ),
                  ),
                  AppSpacing.horizontal16,
                  CupertinoSwitch(
                    activeColor: AppColors.green400,
                    value: provider.pushNotifications,
                    onChanged: provider.setPushNotifications,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
