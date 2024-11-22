// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitFirestoreObject _$HabitFirestoreObjectFromJson(
        Map<String, dynamic> json) =>
    HabitFirestoreObject(
      id: (json['id'] as num).toInt(),
      challengeId: (json['challengeId'] as num?)?.toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      iconPath: json['iconPath'] as String,
      color: json['color'] as String,
      userId: json['userId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$HabitFirestoreObjectToJson(
        HabitFirestoreObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challengeId': instance.challengeId,
      'title': instance.title,
      'description': instance.description,
      'iconPath': instance.iconPath,
      'isCompleted': instance.isCompleted,
      'color': instance.color,
      'startDate': instance.startDate.toIso8601String(),
      'userId': instance.userId,
    };
