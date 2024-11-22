import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_tracker/data/remote/firestore_objects/challenge.dart';
import 'package:habit_tracker/data/remote/firestore_objects/goal.dart';
import 'package:habit_tracker/data/remote/firestore_objects/goal_group.dart';
import 'package:habit_tracker/data/remote/firestore_objects/habit.dart';
import 'package:habit_tracker/data/remote/firestore_objects/habit_progress.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FirebaseDataService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  Future<void> uploadChallenges(List<ChallengeFirestoreObject> challenges) async {
    final futures = challenges.map(
      (challenge) =>
          _firestore.collection(FirebaseCollectionNames.challenges).add(challenge.toJson()),
    );

    await Future.wait(futures);
  }

  Future<void> uploadHabits(List<HabitFirestoreObject> habits) async {
    final futures = habits.map(
      (habit) => _firestore.collection(FirebaseCollectionNames.habits).add(habit.toJson()),
    );

    await Future.wait(futures);
  }

  Future<void> uploadGoalGroups(List<GoalGroupFirestoreObject> goalGroups) async {
    final futures = goalGroups.map(
      (goalGroup) =>
          _firestore.collection(FirebaseCollectionNames.goalGroups).add(goalGroup.toJson()),
    );

    await Future.wait(futures);
  }

  Future<void> uploadGoals(List<GoalFirestoreObject> goals) async {
    final futures = goals.map(
      (goal) => _firestore.collection(FirebaseCollectionNames.goals).add(goal.toJson()),
    );

    await Future.wait(futures);
  }

  Future<void> uploadHabitProgress(List<HabitProgressFirestoreObject> habitProgress) async {
    final futures = habitProgress.map(
      (progress) =>
          _firestore.collection(FirebaseCollectionNames.habitProgress).add(progress.toJson()),
    );

    await Future.wait(futures);
  }

  Future<List<ChallengeFirestoreObject>> fetchChallenges(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.challenges)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => ChallengeFirestoreObject.fromJson(doc.data())).toList();
  }

  Future<List<HabitFirestoreObject>> fetchHabits(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.habits)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => HabitFirestoreObject.fromJson(doc.data())).toList();
  }

  Future<List<GoalGroupFirestoreObject>> fetchGoalGroups(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.goalGroups)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => GoalGroupFirestoreObject.fromJson(doc.data())).toList();
  }

  Future<List<GoalFirestoreObject>> fetchGoals(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.goals)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => GoalFirestoreObject.fromJson(doc.data())).toList();
  }

  Future<List<HabitProgressFirestoreObject>> fetchHabitProgress(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.habitProgress)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => HabitProgressFirestoreObject.fromJson(doc.data())).toList();
  }

  Future<void> deleteChallenge(int challengeId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.challenges)
        .where('id', isEqualTo: challengeId)
        .get();

    final docId = snapshot.docs.first.id;
    await _firestore.collection(FirebaseCollectionNames.challenges).doc(docId).delete();
  }

  Future<void> deleteHabit(int habitId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.habits)
        .where('id', isEqualTo: habitId)
        .get();

    final docId = snapshot.docs.first.id;
    await _firestore.collection(FirebaseCollectionNames.habits).doc(docId).delete();
  }

  Future<void> deleteGoalGroup(int goalGroupId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.goalGroups)
        .where('id', isEqualTo: goalGroupId)
        .get();

    final docId = snapshot.docs.first.id;
    await _firestore.collection(FirebaseCollectionNames.goalGroups).doc(docId).delete();
  }

  Future<void> deleteGoal(int goalId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.goals)
        .where('id', isEqualTo: goalId)
        .get();

    final docId = snapshot.docs.first.id;
    await _firestore.collection(FirebaseCollectionNames.goals).doc(docId).delete();
  }

  Future<void> deleteHabitProgress(int habitProgressId) async {
    final snapshot = await _firestore
        .collection(FirebaseCollectionNames.habitProgress)
        .where('id', isEqualTo: habitProgressId)
        .get();

    final docId = snapshot.docs.first.id;
    await _firestore.collection(FirebaseCollectionNames.habitProgress).doc(docId).delete();
  }
}

class FirebaseCollectionNames {
  FirebaseCollectionNames._();

  static const String habits = 'habits';
  static const String challenges = 'challenges';
  static const String goalGroups = 'goalGroups';
  static const String goals = 'goals';
  static const String habitProgress = 'habitProgress';
}
