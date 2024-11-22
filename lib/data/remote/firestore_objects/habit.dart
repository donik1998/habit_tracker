import 'package:habit_tracker/data/remote/firestore_objects/user_specific_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit.g.dart';

@JsonSerializable()
class HabitFirestoreObject implements UserSpecificObject {
  final int id;
  final int? challengeId;
  final String title;
  final String description;
  final String iconPath;
  final bool isCompleted;
  final String color;
  final DateTime startDate;

  @override
  final String userId;

  HabitFirestoreObject({
    required this.id,
    required this.challengeId,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.color,
    required this.userId,
    required this.startDate,
    required this.isCompleted,
  });

  factory HabitFirestoreObject.fromJson(Map<String, dynamic> json) =>
      _$HabitFirestoreObjectFromJson(json);

  Map<String, dynamic> toJson() => _$HabitFirestoreObjectToJson(this);
}
