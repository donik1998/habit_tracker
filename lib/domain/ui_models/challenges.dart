class ChallengeModel {
  final String title;
  final String iconPath;
  final int duration;
  final DateTime startDate;
  final int progress;
  final List<HabitModel> habits;
  final int id;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.iconPath,
    required this.duration,
    required this.startDate,
    required this.progress,
    required this.habits,
  });

  ChallengeModel copyWith({
    String? title,
    String? iconPath,
    int? duration,
    DateTime? startDate,
    int? progress,
    List<HabitModel>? habits,
    int? id,
  }) {
    return ChallengeModel(
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      duration: duration ?? this.duration,
      startDate: startDate ?? this.startDate,
      progress: progress ?? this.progress,
      habits: habits ?? this.habits,
      id: id ?? this.id,
    );
  }
}

class HabitModel {
  final int challengeId;
  final String title;
  final String description;
  final String iconPath;
  final String hexColor;

  HabitModel({
    required this.challengeId,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.hexColor,
  });

  HabitModel copyWith({
    int? challengeId,
    String? title,
    String? description,
    String? iconPath,
    String? hexColor,
  }) {
    return HabitModel(
      challengeId: challengeId ?? this.challengeId,
      title: title ?? this.title,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      hexColor: hexColor ?? this.hexColor,
    );
  }
}
