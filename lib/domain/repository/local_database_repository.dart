import 'package:drift/drift.dart';
import 'package:habit_tracker/data/local/local_data_storage.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalDatabaseRepository {
  final _database = LocalDatabase.instance;

  Stream<List<HabitModel>> watchHabits() async* {
    yield* _database.select(_database.habits).watch().asyncMap((event) async {
      final habits = List<HabitModel>.empty(growable: true);

      final habitProgressFutures = event.map((e) {
        return Future<HabitModel>(() async {
          final habitProgress = await fetchHabitProgress(e.id);

          return HabitModel(
            title: e.name,
            iconPath: e.iconPath,
            challengeId: e.challengeId,
            description: e.description,
            isCompleted: e.isCompleted,
            color: e.colorHex,
            id: e.id,
            cacheTimestamp: e.cacheTimestamp,
            progress: habitProgress,
          );
        }).then((value) => habits.add(value));
      });
      await Future.wait(habitProgressFutures);
      return habits;
    });
  }

  Stream<List<ChallengeModel>> watchChallenges() async* {
    yield* (_database.select(_database.challenges)..where((tbl) => tbl.isCompleted.equals(false)))
        .watch()
        .asyncMap((event) async {
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
            cacheTimestamp: e.cacheTimestamp,
            progress: e.startDate.difference(DateTime.now()).inDays.abs(),
            isCompleted: e.isCompleted,
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
            cacheTimestamp: e.cacheTimestamp,
          );
        }).then((value) => goalGroups.add(value)),
      );
      await Future.wait(goalGroupsFutures);
      return goalGroups;
    });
  }

  //

  Future<List<HabitModel>> fetchAllHabits() async {
    final habits = await (_database.select(_database.habits)).get();

    return habits.map((habit) {
      return HabitModel(
        id: habit.id,
        title: habit.name,
        iconPath: habit.iconPath,
        challengeId: habit.challengeId,
        description: habit.description,
        color: habit.colorHex,
        cacheTimestamp: habit.cacheTimestamp,
        isCompleted: habit.isCompleted,
        progress: [],
      );
    }).toList();
  }

  Future<List<HabitProgressModel>> fetchAllHabitProgress() async {
    final progressData = await (_database.select(_database.habitRecords)).get();

    return progressData.map((progress) {
      return HabitProgressModel(
        id: progress.id,
        habitId: progress.habitId,
        dayCount: progress.dayCount,
        progress: progress.progress,
        date: progress.date,
        cacheTimestamp: progress.cacheTimestamp,
      );
    }).toList();
  }

  Future<List<GoalGroupModel>> fetchAllGoalGroups() async {
    final goalGroups = await (_database.select(_database.goalsGroup)).get();

    return goalGroups.map((group) {
      return GoalGroupModel(
        id: group.id,
        name: group.name,
        iconPath: group.iconPath,
        cacheTimestamp: group.cacheTimestamp,
        goals: [],
      );
    }).toList();
  }

  Future<List<GoalModel>> fetchAllGoals() async {
    final goals = await (_database.select(_database.goals)).get();

    return goals.map((goal) {
      return GoalModel(
        id: goal.id,
        groupId: goal.groupId,
        description: goal.description,
        isCompleted: goal.isCompleted,
        cacheTimestamp: goal.cacheTimestamp,
      );
    }).toList();
  }

  Future<List<GoalModel>> fetchGoalsByGroupId(int id) async {
    final goals =
        await (_database.select(_database.goals)..where((goal) => goal.groupId.equals(id))).get();
    return goals.map((goal) {
      return GoalModel(
        id: goal.id,
        groupId: goal.groupId,
        description: goal.description,
        isCompleted: goal.isCompleted,
        cacheTimestamp: goal.cacheTimestamp,
      );
    }).toList();
  }

  Future<List<HabitModel>> fetchHabitsByChallengeId(int challengeId) async {
    final habits = await (_database.select(_database.habits)
          ..where(
            (habit) => habit.challengeId.equals(challengeId),
          ))
        .get();
    final result = List<HabitModel>.empty(growable: true);
    final habitProgressFutures = habits.map((habit) => fetchHabitProgress(habit.id).then(
          (habitProgress) => result.add(
            HabitModel(
              id: habit.id,
              title: habit.name,
              iconPath: habit.iconPath,
              challengeId: habit.challengeId,
              description: habit.description,
              color: habit.colorHex,
              cacheTimestamp: habit.cacheTimestamp,
              isCompleted: habit.isCompleted,
              progress: habitProgress,
            ),
          ),
        ));
    await Future.wait(habitProgressFutures);
    return result;
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
      isCompleted: challenge.isCompleted,
      cacheTimestamp: challenge.cacheTimestamp,
      habits: habits,
    );
  }

  Future<HabitModel> fetchHabitById(int habitId) async {
    final habit = await (_database.select(_database.habits)
          ..where((habit) => habit.id.equals(habitId)))
        .getSingleOrNull();
    if (habit == null) {
      throw Exception('Habit with id $habitId not found');
    }
    final habitProgress = await fetchHabitProgress(habit.id);

    return HabitModel(
      id: habit.id,
      title: habit.name,
      iconPath: habit.iconPath,
      challengeId: habit.challengeId,
      description: habit.description,
      color: habit.colorHex,
      progress: habitProgress,
      cacheTimestamp: habit.cacheTimestamp,
      isCompleted: habit.isCompleted,
    );
  }

  Future<List<ChallengeModel>> fetchAllChallenges() async {
    final challenges = await (_database.select(_database.challenges)
          ..where((tbl) => tbl.isCompleted.equals(false)))
        .get();
    return challenges.map((challenge) {
      return ChallengeModel(
        id: challenge.id,
        title: challenge.name,
        iconPath: challenge.iconPath,
        duration: challenge.durationInDays,
        startDate: challenge.startDate,
        progress: challenge.startDate.difference(DateTime.now()).inDays.abs(),
        isCompleted: challenge.isCompleted,
        cacheTimestamp: challenge.cacheTimestamp,
        habits: [],
      );
    }).toList();
  }

  Future<GoalModel?> fetchGoal({
    int? id,
    String? description,
  }) async {
    if (id == null && description == null) {
      throw Exception('Both id and description are null');
    }

    Goal? goal;
    if (id != null) {
      goal =
          await (_database.select(_database.goals)..where((tbl) => tbl.id.equals(id))).getSingle();
    } else if (description != null) {
      goal = await (_database.select(_database.goals)
            ..where((tbl) => tbl.description.equals(description)))
          .getSingle();
    }

    if (goal != null) {
      return GoalModel(
        id: goal.id,
        groupId: goal.groupId,
        description: goal.description,
        isCompleted: goal.isCompleted,
        cacheTimestamp: goal.cacheTimestamp,
      );
    }

    return null;
  }

  Future<List<HabitProgressModel>> fetchHabitProgress(int habitId) async {
    final habitProgress = await (_database.select(_database.habitRecords)
          ..where((tbl) => tbl.habitId.equals(habitId)))
        .get();

    return habitProgress.map((progress) {
      return HabitProgressModel(
        id: progress.id,
        habitId: progress.habitId,
        dayCount: progress.dayCount,
        progress: progress.progress,
        date: progress.date,
        cacheTimestamp: progress.cacheTimestamp,
      );
    }).toList();
  }

  Future<List<ChallengeModel>> fetchFinishedChallenges() async {
    final completedChallenges = await (_database.select(_database.challenges)
          ..where((tbl) => tbl.isCompleted.equals(true)))
        .get();
    final challenges = List<ChallengeModel>.empty(growable: true);

    final challengeFutures = completedChallenges.map(
      (challenge) => fetchHabitsByChallengeId(challenge.id).then(
        (habits) => challenges.add(
          ChallengeModel(
            id: challenge.id,
            title: challenge.name,
            iconPath: challenge.iconPath,
            duration: challenge.durationInDays,
            startDate: challenge.startDate,
            progress: challenge.startDate.difference(DateTime.now()).inDays.abs(),
            habits: habits,
            isCompleted: challenge.isCompleted,
            cacheTimestamp: challenge.cacheTimestamp,
          ),
        ),
      ),
    );

    await Future.wait(challengeFutures);

    return challenges;
  }

  Future<void> deleteChallenge(int challengeId) async {
    await (_database.delete(_database.challenges)..where((tbl) => tbl.id.equals(challengeId))).go();
  }

  Future<void> editChallenge(ChallengeModel challenge) async {
    await (_database.update(_database.challenges)..where((tbl) => tbl.id.equals(challenge.id)))
        .write(
      ChallengesCompanion(
        name: Value(challenge.title),
        iconPath: Value(challenge.iconPath),
        durationInDays: Value(challenge.duration),
        startDate: Value(challenge.startDate),
      ),
    );
  }

  Future<void> editHabitProgress({
    required int habitId,
    required int progressId,
    required double progress,
  }) async {
    await (_database.update(_database.habitRecords)
          ..where((tbl) => tbl.habitId.equals(habitId))
          ..where((tbl) => tbl.id.equals(progressId)))
        .write(
      HabitRecordsCompanion(
        progress: Value(progress),
        cacheTimestamp: Value(DateTime.now()),
      ),
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

    await _database.into(_database.goalsGroup).insert(goalGroup);
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

    await _database.into(_database.challenges).insert(challenge);
  }

  Future<void> updateGoal(GoalModel goal) async {
    await (_database.update(_database.goals)..where((tbl) => tbl.id.equals(goal.id))).write(
      GoalsCompanion(
        description: Value(goal.description),
        isCompleted: Value(goal.isCompleted),
        cacheTimestamp: Value(DateTime.now()),
      ),
    );
  }

  Future<void> createGoal({
    required GoalModel model,
  }) async {
    GoalsCompanion goal = GoalsCompanion(
      description: Value<String>(model.description),
      groupId: Value<int>(model.groupId),
      cacheTimestamp: Value<DateTime>(DateTime.now()),
    );

    await _database.into(_database.goals).insert(goal);
  }

  Future<void> createHabit(HabitModel habit) async {
    HabitsCompanion habitCompanion = HabitsCompanion(
      name: Value(habit.title),
      iconPath: Value(habit.iconPath),
      challengeId: Value(habit.challengeId),
      colorHex: Value(habit.color),
      description: Value(habit.description),
      startDate: Value(DateTime.now()),
      cacheTimestamp: Value(DateTime.now()),
    );

    await _database.into(_database.habits).insert(habitCompanion);

    final freshHabit = await (_database.select(_database.habits)
          ..where(
            (tbl) => tbl.name.equals(habit.title),
          )
          ..where((tbl) => tbl.startDate.equals(DateTime.now())))
        .getSingleOrNull();
    if (freshHabit == null) {
      throw Exception('Habit not found');
    }

    final habitRecords = List.generate(
      21,
      (index) => HabitRecordsCompanion(
        habitId: Value(freshHabit.id),
        dayCount: Value(index + 1),
        progress: const Value(HABIT_PROGRESS_INITIAL),
        date: Value(DateTime.now().add(Duration(days: index))),
        cacheTimestamp: Value(DateTime.now()),
      ),
    ).map((record) => _database.into(_database.habitRecords).insert(record));

    await Future.wait(habitRecords);
  }

  Future<void> finishChallenge(int challengeId) async {
    await (_database.update(_database.challenges)..where((tbl) => tbl.id.equals(challengeId)))
        .write(
      ChallengesCompanion(
        isCompleted: const Value(true),
        cacheTimestamp: Value(DateTime.now()),
      ),
    );
  }
}
