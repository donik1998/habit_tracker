import 'package:habit_tracker/data/remote/firestore_objects/user_specific_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

@JsonSerializable()
class GoalFirestoreObject implements UserSpecificObject {
  final int id;
  final int groupId;
  final String description;
  final bool isCompleted;

  @override
  final String userId;

  GoalFirestoreObject({
    required this.id,
    required this.groupId,
    required this.description,
    required this.isCompleted,
    required this.userId,
  });

  factory GoalFirestoreObject.fromJson(Map<String, dynamic> json) =>
      _$GoalFirestoreObjectFromJson(json);

  Map<String, dynamic> toJson() => _$GoalFirestoreObjectToJson(this);
}
