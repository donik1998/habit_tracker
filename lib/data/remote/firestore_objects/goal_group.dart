import 'package:habit_tracker/data/remote/firestore_objects/user_specific_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal_group.g.dart';

@JsonSerializable()
class GoalGroupFirestoreObject implements UserSpecificObject {
  final int id;
  final String name;
  final String iconPath;

  @override
  final String userId;

  GoalGroupFirestoreObject({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.userId,
  });

  factory GoalGroupFirestoreObject.fromJson(Map<String, dynamic> json) =>
      _$GoalGroupFirestoreObjectFromJson(json);

  Map<String, dynamic> toJson() => _$GoalGroupFirestoreObjectToJson(this);
}
