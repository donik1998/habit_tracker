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
}
