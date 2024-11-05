import 'package:drift/drift.dart';
import 'package:habit_tracker/data/local/local_data_storage.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalDatabaseRepository {
  final _database = LocalDatabase();

  Future<void> deleteChallenge(int challengeId) async {
    await (_database.delete(_database.challenges)..where((tbl) => tbl.id.equals(challengeId))).go();
  }

  Future<void> editChallenge(ChallengeModel challenge) async {
    await (_database.update(_database.challenges)..where((tbl) => tbl.id.equals(challenge.id))).write(
      ChallengesCompanion(
        name: Value(challenge.title),
        iconPath: Value(challenge.iconPath),
        durationInDays: Value(challenge.duration),
        startDate: Value(challenge.startDate),
      ),
    );
  }

  Stream<List<HabitModel>> watchHabits() async* {
    yield* _database.select(_database.habits).watch().asyncMap((event) async {
      return event.map((e) {
        return HabitModel(
          title: e.name,
          iconPath: e.iconPath,
          challengeId: e.challengeId,
          description: e.description,
          hexColor: e.colorHex,
        );
      }).toList();
    });
  }

  Stream<List<ChallengeModel>> watchChallenges() async* {
    yield* _database.select(_database.challenges).watch().asyncMap((event) async {
      final challenges = List<ChallengeModel>.empty(growable: true);
      final challengesFutures = event.map(
        (e) => Future(() async {
          final allHabits = await fetchHabitsByChallengeId(e.id);
          return ChallengeModel(
            id: e.id,
            title: e.name,
            iconPath: e.iconPath,
            duration: e.durationInDays,
            startDate: e.startDate,
            progress: e.startDate.difference(DateTime.now()).inDays.abs(),
            habits: allHabits,
          );
        }).then((value) => challenges.add(value)),
      );
      await Future.wait(challengesFutures);
      return challenges;
    });
  }

  Stream<List<GoalGroupModel>> watchGoalGroups() async* {
    yield* _database.select(_database.goalsGroup).watch().asyncMap((event) async {
      final goalGroups = List<GoalGroupModel>.empty(growable: true);
      final goalGroupsFutures = event.map(
        (e) => Future(() async {
          final goals = await fetchGoalsByGroupId(e.id);
          return GoalGroupModel(
            id: e.id,
            goals: goals,
            iconPath: e.iconPath,
            name: e.name,
          );
        }).then((value) => goalGroups.add(value)),
      );
      await Future.wait(goalGroupsFutures);
      return goalGroups;
    });
  }

  Future<List<GoalModel>> fetchGoalsByGroupId(int id) async {
    final goals = await (_database.select(_database.goals)..where((goal) => goal.groupId.equals(id))).get();
    return goals.map((goal) {
      return GoalModel(
        id: goal.id,
        groupId: goal.groupId,
        description: goal.description,
      );
    }).toList();
  }

  Future<List<HabitModel>> fetchHabitsByChallengeId(int challengeId) async {
    final habits = await (_database.select(_database.habits)
          ..where(
            (habit) => habit.challengeId.equals(challengeId),
          ))
        .get();
    return habits.map((habit) {
      return HabitModel(
        title: habit.name,
        iconPath: habit.iconPath,
        challengeId: habit.challengeId,
        description: habit.description,
        hexColor: habit.colorHex,
      );
    }).toList();
  }

  Future<ChallengeModel> fetchChallengeById(int challengeId) async {
    final challenge = await (_database.select(_database.challenges)
          ..where((challenge) => challenge.id.equals(challengeId)))
        .getSingleOrNull();
    if (challenge == null) {
      throw Exception('Challenge with id $challengeId not found');
    }
    final habits = await fetchHabitsByChallengeId(challenge.id);

    return ChallengeModel(
      id: challenge.id,
      title: challenge.name,
      iconPath: challenge.iconPath,
      duration: challenge.durationInDays,
      startDate: challenge.startDate,
      progress: challenge.startDate.difference(DateTime.now()).inDays.abs(),
      habits: habits,
    );
  }

  Future<void> createGoalGroup({
    required String title,
    required String iconPath,
  }) async {
    GoalsGroupCompanion goalGroup = GoalsGroupCompanion(
      name: Value<String>(title),
      iconPath: Value<String>(iconPath),
      cacheTimestamp: Value<DateTime>(DateTime.now()),
    );

    final res = await _database.into(_database.goalsGroup).insert(goalGroup);
  }

  Future<void> createChallenge({
    required String challengeName,
    required String iconPath,
    required int durationInDays,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    ChallengesCompanion challenge = ChallengesCompanion(
      name: Value<String>(challengeName),
      iconPath: Value<String>(iconPath),
      durationInDays: Value<int>(durationInDays),
      isCompleted: const Value<bool>(false),
      startDate: Value<DateTime>(startDate),
      endDate: Value<DateTime>(endDate),
      cacheTimestamp: Value<DateTime>(DateTime.now()),
    );

    final res = await _database.into(_database.challenges).insert(challenge);
  }
}
