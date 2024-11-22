class GoalGroupModel {
  final int id;
  final String name;
  final String iconPath;
  final List<GoalModel> goals;
  final DateTime cacheTimestamp;

  GoalGroupModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.goals,
    required this.cacheTimestamp,
  });

  GoalGroupModel copyWith({
    int? id,
    String? name,
    String? iconPath,
    List<GoalModel>? goals,
    DateTime? cacheTimestamp,
  }) {
    return GoalGroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      goals: goals ?? this.goals,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }
}

class GoalModel {
  final int id;
  final int groupId;
  final String description;
  final bool isCompleted;
  final DateTime cacheTimestamp;

  GoalModel({
    required this.id,
    required this.groupId,
    required this.description,
    required this.isCompleted,
    required this.cacheTimestamp,
  });

  GoalModel copyWith({
    int? id,
    int? groupId,
    String? description,
    bool? isCompleted,
    DateTime? cacheTimestamp,
  }) {
    return GoalModel(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      cacheTimestamp: cacheTimestamp ?? this.cacheTimestamp,
    );
  }
}
