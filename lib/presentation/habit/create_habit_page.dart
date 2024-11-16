import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_app_color_filter/flutter_in_app_color_filter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/selectable_glyph.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_drop_down_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/custom_input_field.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/titled_switch.dart';
import 'package:habit_tracker/presentation/habit/provider/create_habit_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:provider/provider.dart';

class CreateHabitPage extends StatelessWidget {
  const CreateHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        automaticallyImplyLeading: false,
        title: Text(
          LocaleKeys.create_new_habit.tr(),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.svg.close.path),
          ),
        ],
      ),
      body: Consumer<CreateHabitProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomInputField(
                  label: LocaleKeys.habit_name.tr(),
                  controller: provider.habitNameController,
                ),
                AppSpacing.vertical16,
                CustomInputField(
                  label: LocaleKeys.description.tr(),
                  controller: provider.descriptionController,
                ),
                AppSpacing.vertical16,
                Text(
                  LocaleKeys.icon.tr(),
                  style:
                      textTheme?.mediumTextTheme.typography3.copyWith(color: AppColors.platinum900),
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
                ColorPickerWidget(
                  transparentPlaceholder: Image.asset(
                    Assets.png.transparentPattern.path,
                    fit: BoxFit.cover,
                  ),
                  readyButton: StandardButton(
                    onPressed: () => Navigator.pop(context),
                    text: LocaleKeys.save.tr(),
                    customWidth: MediaQuery.of(context).size.width * 0.5,
                    customHeight: MediaQuery.of(context).size.width * 0.5 * 0.25,
                  ),
                  selectionBorderColor: AppColors.purple500,
                  onColorSelected: provider.selectColor,
                  title: Text(
                    LocaleKeys.select_color.tr(),
                    style: textTheme?.boldTextTheme.typography3,
                  ),
                  lastColorPickerWidget: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: provider.selectedColor != null
                        ? Container(
                            height: 100,
                            width: 100,
                            color: provider.selectedColor,
                          )
                        : Image.asset(
                            Assets.png.multiColorBall.path,
                            fit: BoxFit.cover,
                            height: 48,
                            width: 48,
                          ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 32,
                  color: AppColors.platinum100,
                ),
                if (provider.challenges.isNotEmpty && provider.challengeId == null)
                  TitledSwitch(
                    onChanged: (value) => provider.setAddToChallenge(value),
                    title: LocaleKeys.add_to_challenge.tr(),
                    value: provider.addToChallenge,
                  ),
                AppSpacing.vertical12,
                if (provider.addToChallenge && provider.challengeId == null)
                  CustomDropDownButton(
                    title: LocaleKeys.select_challenge.tr(),
                    onItemSelected: (value) => provider.setChallengeId(value.value),
                    items: provider.challenges
                        .map<DropdownMenuItem<int>>(
                          (e) => DropdownMenuItem<int>(
                            value: e.id,
                            child: Text(
                              e.title,
                              style: textTheme?.regularTextTheme.typography3,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                const Spacer(),
                StandardButton(
                  onPressed: () => provider.createHabit().then((value) {
                    if (value) Navigator.pop(context);
                  }),
                  text: LocaleKeys.create.tr(),
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
