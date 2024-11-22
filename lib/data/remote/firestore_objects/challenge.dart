import 'package:habit_tracker/data/remote/firestore_objects/user_specific_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';

@JsonSerializable()
class ChallengeFirestoreObject implements UserSpecificObject {
  final String title;
  final String iconPath;
  final int duration;
  final DateTime startDate;
  final int progress;
  final int id;
  final bool isCompleted;

  @override
  final String userId;

  ChallengeFirestoreObject({
    required this.title,
    required this.iconPath,
    required this.duration,
    required this.startDate,
    required this.progress,
    required this.id,
    required this.isCompleted,
    required this.userId,
  });

  factory ChallengeFirestoreObject.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFirestoreObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeFirestoreObjectToJson(this);
}
