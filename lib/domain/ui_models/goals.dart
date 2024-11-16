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

  GoalGroupModel copyWith({
    int? id,
    String? name,
    String? iconPath,
    List<GoalModel>? goals,
  }) {
    return GoalGroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      goals: goals ?? this.goals,
    );
  }
}

class GoalModel {
  final int id;
  final int groupId;
  final String description;
  final bool isCompleted;

  GoalModel({
    required this.id,
    required this.groupId,
    required this.description,
    required this.isCompleted,
  });

  GoalModel copyWith({
    int? id,
    int? groupId,
    String? description,
    bool? isCompleted,
  }) {
    return GoalModel(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
