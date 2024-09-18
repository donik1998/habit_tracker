import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class NoChallengesWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const NoChallengesWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue50,
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.svg.directionsRun.path,
                color: AppColors.blue600,
              ),
            ),
          ),
          AppSpacing.vertical20,
          Text(
            LocaleKeys.no_challenges_yet.tr(),
            style: textTheme?.boldTextTheme.typography6,
          ),
          AppSpacing.vertical20,
          Text(
            LocaleKeys.challenges_tip.tr(),
            style: textTheme?.regularTextTheme.typography3.copyWith(color: AppColors.textFieldText),
          ),
          AppSpacing.vertical20,
          StandardButton(
            customWidth: MediaQuery.of(context).size.width - 72,
            customHeight: (MediaQuery.of(context).size.width - 72) * 0.1685,
            onPressed: () => onTap?.call(),
            text: LocaleKeys.create_new.tr(),
          ),
        ],
      ),
    );
  }
}
