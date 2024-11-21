import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';

class LogoutSheet extends StatelessWidget {
  final VoidCallback? onLogout;

  const LogoutSheet({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 4,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSpacing.vertical8,
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 32,
              height: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.borderStandard,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          AppSpacing.vertical20,
          SvgPicture.asset(
            Assets.svg.logOutThin.path,
            height: MediaQuery.sizeOf(context).height / 10,
          ),
        ],
      ),
    );
  }
}
