import 'package:habit_tracker/data/remote/firestore_objects/user_specific_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_progress.g.dart';

@JsonSerializable()
class HabitProgressFirestoreObject implements UserSpecificObject {
  final int id;
  final int habitId;
  final int dayCount;
  final DateTime date;
  final double progress;

  @override
  final String userId;

  HabitProgressFirestoreObject({
    required this.id,
    required this.habitId,
    required this.date,
    required this.progress,
    required this.dayCount,
    required this.userId,
  });

  factory HabitProgressFirestoreObject.fromJson(Map<String, dynamic> json) =>
      _$HabitProgressFirestoreObjectFromJson(json);

  Map<String, dynamic> toJson() => _$HabitProgressFirestoreObjectToJson(this);
}
