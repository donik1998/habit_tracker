import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_icon_button.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/theme_extension.dart';

class WeekSelector extends StatefulWidget {
  final ValueChanged<DateTimeRange> onWeekSelected;

  const WeekSelector({
    super.key,
    required this.onWeekSelected,
  });

  @override
  State<WeekSelector> createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  DateTimeRange _currentWeek = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
    end: DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onWeekSelected(_currentWeek);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.customTextTheme;

    final selectorSize = Size(
      MediaQuery.sizeOf(context).width - 32,
      (MediaQuery.sizeOf(context).width - 32) * 0.1325,
    );
    return Container(
      height: selectorSize.height,
      width: selectorSize.width,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: AppColors.platinum100,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StandardIconButton(
            onPressed: () => setState(() {
              _currentWeek = DateTimeRange(
                start: _currentWeek.start.subtract(const Duration(days: 7)),
                end: _currentWeek.end.subtract(const Duration(days: 7)),
              );
              widget.onWeekSelected(_currentWeek);
            }),
            icon: Assets.svg.chevronLeft,
            backgroundColor: Colors.white,
            iconColor: Colors.black,
          ),
          AppSpacing.horizontal16,
          Center(
            child: Text(
              '${DateFormat('dd MMMM', context.locale.languageCode).format(_currentWeek.start)}'
              ' - ${DateFormat('dd MMMM', context.locale.languageCode).format(_currentWeek.end)}',
              style: textTheme?.boldTextTheme.typography3,
            ),
          ),
          AppSpacing.horizontal16,
          StandardIconButton(
            onPressed: () => setState(() {
              _currentWeek = DateTimeRange(
                start: _currentWeek.start.add(const Duration(days: 7)),
                end: _currentWeek.end.add(const Duration(days: 7)),
              );
              widget.onWeekSelected(_currentWeek);
            }),
            icon: Assets.svg.chevronRight,
            backgroundColor: Colors.white,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
