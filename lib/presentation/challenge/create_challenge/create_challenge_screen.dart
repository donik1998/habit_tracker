import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/challenge/create_challenge/create_challenge_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/selectable_glyph.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_input_field.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class CreateChallengePage extends StatelessWidget {
  const CreateChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        title: Text(
          LocaleKeys.challenge_creation.tr(),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.svg.close.path),
          ),
        ],
      ),
      body: Consumer<CreateChallengePageProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.vertical24,
                Text(
                  LocaleKeys.create_challenge_title.tr(),
                  style: textTheme?.boldTextTheme.typography6,
                ),
                AppSpacing.vertical24,
                Text(
                  LocaleKeys.icon.tr(),
                  style: textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.platinum900),
                ),
                AppSpacing.vertical12,
                Row(
                  children: [
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.lightning.path),
                      iconPath: Assets.svg.lightning.path,
                      selected: provider.selectedIconPath == Assets.svg.lightning.path,
                      width: 48,
                    ),
                    AppSpacing.horizontal12,
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.directionsRunSmall.path),
                      iconPath: Assets.svg.directionsRunSmall.path,
                      selected: provider.selectedIconPath == Assets.svg.directionsRunSmall.path,
                      width: 48,
                    ),
                    AppSpacing.horizontal12,
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.codeBrowser.path),
                      iconPath: Assets.svg.codeBrowser.path,
                      selected: provider.selectedIconPath == Assets.svg.codeBrowser.path,
                      width: 48,
                    ),
                    AppSpacing.horizontal12,
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.award.path),
                      iconPath: Assets.svg.award.path,
                      selected: provider.selectedIconPath == Assets.svg.award.path,
                      width: 48,
                    ),
                    AppSpacing.horizontal12,
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.rocket.path),
                      iconPath: Assets.svg.rocket.path,
                      selected: provider.selectedIconPath == Assets.svg.rocket.path,
                      width: 48,
                    ),
                    AppSpacing.horizontal12,
                    SelectableGlyph(
                      onSelected: () => provider.selectIcon(Assets.svg.plus.path),
                      iconPath: Assets.svg.plus.path,
                      selected: provider.selectedIconPath == Assets.svg.plus.path,
                      width: 48,
                    ),
                  ],
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  label: LocaleKeys.title.tr(),
                  controller: provider.titleController,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  label: LocaleKeys.duration.tr(),
                  controller: provider.durationController,
                  suffixIcon: SvgPicture.asset(Assets.svg.informationOutlined.path),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  label: LocaleKeys.start_date.tr(),
                  controller: provider.startDateController,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => Material(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.375,
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              color: CupertinoColors.systemBackground.resolveFrom(context),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 8,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                AppSpacing.vertical10,
                                Text(
                                  LocaleKeys.select_start_date.tr(),
                                  style: textTheme?.boldTextTheme.typography3,
                                ),
                                AppSpacing.vertical10,
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    mode: CupertinoDatePickerMode.date,
                                    use24hFormat: true,
                                    showDayOfWeek: true,
                                    onDateTimeChanged: (DateTime newDate) => provider.setStartDate(newDate),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset(Assets.svg.calendar.path),
                  ),
                  readOnly: true,
                ),
                const Spacer(),
                StandardButton(
                  onPressed: () => provider.saveChallenge().then((success) {
                    if (success) Navigator.pop(context);
                  }),
                  disabled: !provider.isFormValid,
                  loading: provider.loading,
                  text: LocaleKeys.create.tr(),
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
