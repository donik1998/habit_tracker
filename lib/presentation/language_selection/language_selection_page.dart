import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/data/local/preferences.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/radio_tile.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'en';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Assets.png.mountainsBack.path,
              height: MediaQuery.of(context).size.height * 0.625,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            )
                .animate()
                .scaleXY(
                  begin: 2,
                  end: 1.05,
                  duration: const Duration(milliseconds: 1000),
                )
                .blurXY(
                  begin: 25,
                  end: 0,
                  duration: const Duration(milliseconds: 1000),
                )
                .fadeIn(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.svg.logoWhite.path,
                    width: MediaQuery.of(context).size.width * 0.45,
                  ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
                ],
              ),
            ).animate(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.select_lang.tr(),
                    style: textTheme?.boldTextTheme.typography6,
                  ),
                  AppSpacing.vertical16,
                  RadioTile(
                    mask: 'English',
                    value: 'en',
                    selected: _selectedLanguage == 'en',
                    onChanged: (value) {
                      setState(() => _selectedLanguage = 'en');
                      context.setLocale(const Locale('en'));
                    },
                  ),
                  const Spacer(),
                  RadioTile(
                    mask: 'Русский',
                    value: 'ru',
                    selected: _selectedLanguage == 'ru',
                    onChanged: (value) {
                      setState(() => _selectedLanguage = 'ru');
                      context.setLocale(const Locale('ru'));
                    },
                  ),
                  const Spacer(),
                  RadioTile(
                    mask: 'Özbek',
                    value: 'uz',
                    selected: _selectedLanguage == 'uz',
                    onChanged: (value) {
                      setState(() => _selectedLanguage = 'uz');
                      context.setLocale(const Locale('uz'));
                    },
                  ),
                  AppSpacing.vertical16,
                  StandardButton(
                    text: LocaleKeys.start.tr(),
                    loading: loading,
                    onPressed: () {
                      setState(() => loading = true);
                      unawaited(locator<LocalPreferences>().savePreference(
                        AppLocalPreferences.appLanguage,
                        _selectedLanguage,
                      ));
                      final user = FirebaseAuth.instance.currentUser;
                      if (user == null) {
                        Navigator.pushReplacementNamed(context, AppRoutes.authTypeSelection);
                      } else {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      }
                    },
                  ),
                  AppSpacing.vertical8,
                ],
              ).animate().fadeIn(
                    delay: const Duration(milliseconds: 1000),
                  ),
            ).animate().slideY(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 1000),
                ),
          ),
        ],
      ),
    );
  }
}
