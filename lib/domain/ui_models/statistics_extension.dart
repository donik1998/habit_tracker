import 'package:habit_tracker/domain/ui_models/challenges.dart';

extension ChallengeStatisticsExtension on ChallengeModel {
  int get completenessInPercent {
    final habitsCount = habits.length;
    final totalHabitsProgress = habits.fold<int>(
      0,
      (previousValue, element) => previousValue + element.completenessInPercent,
    );

    return (totalHabitsProgress / habitsCount).ceil();
  }

  int get daysCompleted => habits.fold(0, (prev, curr) => prev + curr.completedDaysCount);
}

extension HabitStatisticsExtension on HabitModel {
  int get completenessInPercent {
    final maxProgress = progress.length.toDouble();
    final progressDone =
        progress.fold<double>(0, (previousValue, element) => previousValue + element.progress);

    return (progressDone / maxProgress).ceil();
  }
}
