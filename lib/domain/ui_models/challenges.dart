import 'dart:ui';

class ChallengeModel {
  final String title;
  final String iconPath;
  final int duration;
  final DateTime startDate;
  final int progress;
  final List<HabitModel> habits;
  final int id;
  final bool isCompleted;
  final DateTime cacheTimestamp;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.iconPath,
    required this.duration,
    required this.startDate,
    required this.progress,
    required this.habits,
    required this.isCompleted,
    required this.cacheTimestamp,
  });

  ChallengeModel copyWith({
    String? title,
    String? iconPath,
    int? duration,
    DateTime? startDate,
    int? progress,
    List<HabitModel>? habits,
    int? id,
    bool? isCompleted,
    DateTime? cacheTimestamp,
  }) {
    return ChallengeModel(
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      duration: duration ?? this.duration,
      startDate: startDate ?? this.startDate,
      progress: progress ?? this.progress,
      habits: habits ?? this.habits,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  DateTime get endDate => startDate.add(Duration(days: duration));

  bool get canFinish => duration == progress;

  List<HabitModel> get completedTodayHabits => habits
      .where((element) =>
          element.todayCompletenessStatus != HabitProgressStatus.notStarted &&
          element.todayCompletenessStatus != HabitProgressStatus.initial)
      .toList();

  List<HabitModel> get notCompletedTodayHabits => habits
      .where((element) =>
          element.todayCompletenessStatus == HabitProgressStatus.notStarted ||
          element.todayCompletenessStatus == HabitProgressStatus.initial)
      .toList();
}

class HabitModel {
  final int id;
  final int? challengeId;
  final String title;
  final String description;
  final bool isCompleted;
  final String iconPath;
  final String color;
  final List<HabitProgressModel> progress;
  final DateTime cacheTimestamp;

  Color get uiColor => Color(int.parse(color, radix: 16));

  DateTime? get startDate {
    if (progress.isEmpty) return null;

    return progress.fold<DateTime>(
      progress.first.date,
      (previousValue, element) =>
          element.date.isBefore(previousValue) ? element.date : previousValue,
    );
  }

  DateTime? get endDate {
    if (progress.isEmpty) return null;

    return progress.fold<DateTime>(
      progress.first.date,
      (previousValue, element) =>
          element.date.isAfter(previousValue) ? element.date : previousValue,
    );
  }

  int get completedDaysCount => progress
      .where((element) =>
          element.progress == HABIT_PROGRESS_COMPLETED ||
          element.progress == HABIT_PROGRESS_HALF_DONE)
      .length;

  HabitProgressStatus get todayCompletenessStatus {
    final today = DateTime.now();
    if (progress.isEmpty) return HabitProgressStatus.notStarted;
    final progressItem = progress.firstWhere(
      (progressDataItem) => progressDataItem.date.isAtSameMomentAs(today),
      orElse: () => HabitProgressModel.empty(),
    );

    return progressItem.progressStatus;
  }

  HabitProgressModel get todayProgress {
    final today = DateTime.now();
    if (progress.isEmpty) return HabitProgressModel.empty();
    return progress.firstWhere(
      (progressDataItem) => progressDataItem.date.isAtSameMomentAs(today),
      orElse: () => HabitProgressModel.empty(),
    );
  }

  HabitModel({
    this.id = -1,
    this.challengeId,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.color,
    this.progress = const [],
    required this.isCompleted,
    required this.cacheTimestamp,
  });

  HabitModel copyWith({
    int? challengeId,
    String? title,
    String? description,
    String? iconPath,
    String? color,
    List<HabitProgressModel>? progress,
    bool? isCompleted,
    DateTime? cacheTimestamp,
  }) {
    return HabitModel(
      id: id,
      challengeId: challengeId ?? this.challengeId,
      title: title ?? this.title,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }

  factory HabitModel.empty() {
    return HabitModel(
      id: -1,
      title: '',
      description: '',
      iconPath: '',
      color: '',
      progress: [],
      isCompleted: false,
      cacheTimestamp: DateTime.now(),
    );
  }

  bool get isEmpty => id == -1;
}

class HabitProgressModel {
  final int id;
  final int habitId;
  final int dayCount;
  final double progress;
  final DateTime date;
  final DateTime cacheTimestamp;

  HabitProgressModel({
    required this.id,
    required this.habitId,
    required this.dayCount,
    this.progress = HABIT_PROGRESS_INITIAL,
    required this.date,
    required this.cacheTimestamp,
  });

  HabitProgressModel.empty()
      : id = -1,
        habitId = -1,
        dayCount = -1,
        progress = HABIT_PROGRESS_INITIAL,
        date = DateTime.now(),
        cacheTimestamp = DateTime.now();

  bool get isEmpty => id == -1;

  HabitProgressStatus get progressStatus => progress == HABIT_PROGRESS_COMPLETED
      ? HabitProgressStatus.completed
      : progress >= HABIT_PROGRESS_HALF_DONE
          ? HabitProgressStatus.halfDone
          : progress == HABIT_PROGRESS_INITIAL
              ? HabitProgressStatus.initial
              : HabitProgressStatus.notStarted;

  HabitProgressModel copyWith({
    int? id,
    int? habitId,
    int? dayCount,
    double? progress,
    DateTime? date,
    DateTime? cacheTimestamp,
  }) {
    return HabitProgressModel(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      dayCount: dayCount ?? this.dayCount,
      progress: progress ?? this.progress,
      date: date ?? this.date,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }
}

enum HabitProgressStatus {
  initial,
  notStarted,
  halfDone,
  completed,
}

const double HABIT_PROGRESS_INITIAL = 0.0;
const double HABIT_PROGRESS_COMPLETED = 1.0;
const double HABIT_PROGRESS_HALF_DONE = 0.5;
const double HABIT_PROGRESS_NOT_DONE = 0.1;
