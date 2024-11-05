class GoalGroupModel {
  final int id;
  final String name;
  final String iconPath;
  final List<GoalModel> goals;

  GoalGroupModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.goals,
  });
}

class GoalModel {
  final int id;
  final int groupId;
  final String description;

  GoalModel({
    required this.id,
    required this.groupId,
    required this.description,
  });
}
