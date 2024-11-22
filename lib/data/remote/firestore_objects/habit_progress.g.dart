// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitProgressFirestoreObject _$HabitProgressFirestoreObjectFromJson(
        Map<String, dynamic> json) =>
    HabitProgressFirestoreObject(
      id: (json['id'] as num).toInt(),
      habitId: (json['habitId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      progress: (json['progress'] as num).toDouble(),
      dayCount: (json['dayCount'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$HabitProgressFirestoreObjectToJson(
        HabitProgressFirestoreObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'dayCount': instance.dayCount,
      'date': instance.date.toIso8601String(),
      'progress': instance.progress,
      'userId': instance.userId,
    };
