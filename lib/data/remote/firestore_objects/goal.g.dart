// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalFirestoreObject _$GoalFirestoreObjectFromJson(Map<String, dynamic> json) =>
    GoalFirestoreObject(
      id: (json['id'] as num).toInt(),
      groupId: (json['groupId'] as num).toInt(),
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$GoalFirestoreObjectToJson(
        GoalFirestoreObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'userId': instance.userId,
    };
