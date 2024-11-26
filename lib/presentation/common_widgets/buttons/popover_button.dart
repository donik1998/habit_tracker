import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/utils/theme_extension.dart';
import 'package:popover/popover.dart';

class PopOverButton extends StatelessWidget {
  final Size size;
  final String text;

  const PopOverButton({
    super.key,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        // contentDxOffset: MediaQuery.sizeOf(context).width - 84,
        contentDyOffset: 0,
        // arrowDxOffset: MediaQuery.sizeOf(context).width / 2,
        width: size.width,
        height: size.height,
        arrowHeight: 15,
        arrowWidth: 30,
        direction: PopoverDirection.top,
        bodyBuilder: (context) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              text,
              style: textTheme?.mediumTextTheme.typography3,
            ),
          );
        },
      ),
      child: SvgPicture.asset(Assets.svg.informationOutlined.path),
    );
  }
}
