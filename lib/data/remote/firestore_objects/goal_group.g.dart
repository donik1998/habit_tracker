// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalGroupFirestoreObject _$GoalGroupFirestoreObjectFromJson(
        Map<String, dynamic> json) =>
    GoalGroupFirestoreObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$GoalGroupFirestoreObjectToJson(
        GoalGroupFirestoreObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'userId': instance.userId,
    };
