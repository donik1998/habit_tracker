// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeFirestoreObject _$ChallengeFirestoreObjectFromJson(
        Map<String, dynamic> json) =>
    ChallengeFirestoreObject(
      title: json['title'] as String,
      iconPath: json['iconPath'] as String,
      duration: (json['duration'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      progress: (json['progress'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$ChallengeFirestoreObjectToJson(
        ChallengeFirestoreObject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iconPath': instance.iconPath,
      'duration': instance.duration,
      'startDate': instance.startDate.toIso8601String(),
      'progress': instance.progress,
      'id': instance.id,
      'isCompleted': instance.isCompleted,
      'userId': instance.userId,
    };
