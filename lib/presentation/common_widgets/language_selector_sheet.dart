import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/tiles/radio_tile.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class LanguageSelectorSheet extends StatefulWidget {
  final String currentLangCode;

  const LanguageSelectorSheet({
    super.key,
    required this.currentLangCode,
  });

  @override
  State<LanguageSelectorSheet> createState() => _LanguageSelectorSheetState();
}

class _LanguageSelectorSheetState extends State<LanguageSelectorSheet> {
  late String _selectedLanguage = widget.currentLangCode;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.425,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSpacing.vertical4,
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 32,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          AppSpacing.vertical16,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.select_lang.tr(),
                  style: textTheme?.boldTextTheme.typography3,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          AppSpacing.vertical16,
          RadioTile.transparent(
            mask: 'English',
            value: 'en',
            selected: _selectedLanguage == 'en',
            onChanged: (value) {
              setState(() => _selectedLanguage = 'en');
              context.setLocale(const Locale('en'));
            },
          ),
          RadioTile.transparent(
            mask: 'Русский',
            value: 'ru',
            selected: _selectedLanguage == 'ru',
            onChanged: (value) {
              setState(() => _selectedLanguage = 'ru');
              context.setLocale(const Locale('ru'));
            },
          ),
          RadioTile.transparent(
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
            onPressed: () => Navigator.pop(context),
            text: LocaleKeys.save.tr(),
          ),
          AppSpacing.vertical24,
        ],
      ),
    );
  }
}
