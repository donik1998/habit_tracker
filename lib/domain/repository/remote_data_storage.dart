import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/data/remote/firebase_data_service.dart';
import 'package:habit_tracker/data/remote/firestore_objects/challenge.dart';
import 'package:habit_tracker/data/remote/firestore_objects/goal.dart';
import 'package:habit_tracker/data/remote/firestore_objects/goal_group.dart';
import 'package:habit_tracker/data/remote/firestore_objects/habit.dart';
import 'package:habit_tracker/data/remote/firestore_objects/habit_progress.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoteDataStorage {
  FirebaseDataService get _firebaseDataProvider => locator<FirebaseDataService>();

  Future<void> uploadChallenges(List<ChallengeModel> challenges) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not authenticated');
    }
    final challengesFirestoreObjects = challenges
        .map(
          (e) => ChallengeFirestoreObject(
            title: e.title,
            iconPath: e.iconPath,
            duration: e.duration,
            startDate: e.startDate,
            progress: e.progress,
            id: e.id,
            isCompleted: e.isCompleted,
            userId: userId,
          ),
        )
        .toList();
    await _firebaseDataProvider.uploadChallenges(challengesFirestoreObjects);
  }

  Future<void> uploadHabits(List<HabitModel> habits) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not authenticated');
    }
    final habitsFirestoreObjects = habits
        .map(
          (e) => HabitFirestoreObject(
            challengeId: e.challengeId,
            title: e.title,
            iconPath: e.iconPath,
            isCompleted: e.isCompleted,
            color: e.color,
            description: e.description,
            startDate: e.startDate ?? e.cacheTimestamp,
            id: e.id,
            userId: userId,
          ),
        )
        .toList();
    await _firebaseDataProvider.uploadHabits(habitsFirestoreObjects);
  }

  Future<void> uploadHabitProgress(List<HabitProgressModel> habitProgress) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not authenticated');
    }

    final habitProgressFirestoreObjects = habitProgress
        .map(
          (e) => HabitProgressFirestoreObject(
            userId: userId,
            habitId: e.habitId,
            dayCount: e.dayCount,
            progress: e.progress,
            date: e.date,
            id: e.id,
          ),
        )
        .toList();
    await _firebaseDataProvider.uploadHabitProgress(habitProgressFirestoreObjects);
  }

  Future<void> uploadGoalGroups(List<GoalGroupModel> goalGroups) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not authenticated');
    }
    final goalGroupsFirestoreObjects = goalGroups
        .map(
          (e) => GoalGroupFirestoreObject(
            id: e.id,
            name: e.name,
            userId: userId,
            iconPath: e.iconPath,
          ),
        )
        .toList();
    await _firebaseDataProvider.uploadGoalGroups(goalGroupsFirestoreObjects);
  }

  Future<void> uploadGoals(List<GoalModel> goals) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not authenticated');
    }
    final goalsFirestoreObjects = goals
        .map(
          (e) => GoalFirestoreObject(
            userId: userId,
            id: e.id,
            description: e.description,
            groupId: e.groupId,
            isCompleted: e.isCompleted,
          ),
        )
        .toList();
    await _firebaseDataProvider.uploadGoals(goalsFirestoreObjects);
  }
}
