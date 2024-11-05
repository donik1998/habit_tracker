import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_icon_button.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String avatarPath;
  final VoidCallback? onEditProfile;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.avatarPath,
    this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width,
        maxHeight: MediaQuery.sizeOf(context).width * 0.25,
        minWidth: MediaQuery.sizeOf(context).width * 0.9125,
        minHeight: MediaQuery.sizeOf(context).width * 0.9125 * 0.25,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: AppColors.purple50,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  avatarPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, trace) => ColoredBox(
                    color: AppColors.purple500,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        Assets.svg.informationOutlined.path,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacing.horizontal16,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme?.boldTextTheme.typography3.copyWith(
                        color: AppColors.purple900,
                      ),
                    ),
                    AppSpacing.vertical4,
                    Text(
                      email,
                      style: textTheme?.regularTextTheme.typography2.copyWith(
                        color: AppColors.purple500,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.horizontal16,
              if (onEditProfile != null)
                StandardIconButton(
                  onPressed: onEditProfile!,
                  icon: Assets.svg.edit,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
