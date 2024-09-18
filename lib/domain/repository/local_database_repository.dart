import 'package:drift/drift.dart';
import 'package:habit_tracker/data/local/local_data_storage.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalDatabaseRepository {
  final _database = LocalDatabase();

  Future<void> saveData() async {
    // Save data to local database
  }

  Stream<List<ChallengeModel>> watchChallenges() async* {
    yield* _database.select(_database.challenges).watch().asyncMap((event) async {
      final allHabits = await fetchAllHabits();
      return event
          .map(
            (e) => ChallengeModel(
              id: e.id,
              title: e.name,
              iconPath: e.iconPath,
              duration: e.durationInDays,
              startDate: e.startDate,
              progress: e.startDate.difference(DateTime.now()).inDays.abs(),
              habits: allHabits.where((habit) => habit.challengeId == e.id).toList(),
            ),
          )
          .toList();
    });
  }

  Future<List<HabitModel>> fetchAllHabits() async {
    final habits = await _database.select(_database.habits).get();
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

  Future<List<ChallengeModel>> fetchChallenges() async {
    final challenges = await _database.select(_database.challenges).get();
    final challengeModels = List<ChallengeModel>.empty(growable: true);
    final habitsFutures = challenges.map(
      (challenge) => fetchHabitsByChallengeId(challenge.id).then((habits) {
        challengeModels.add(
          ChallengeModel(
            id: challenge.id,
            title: challenge.name,
            iconPath: challenge.iconPath,
            duration: challenge.durationInDays,
            startDate: challenge.startDate,
            progress: challenge.startDate.difference(DateTime.now()).inDays.abs(),
            habits: habits,
          ),
        );
      }),
    );
    await Future.wait(habitsFutures);
    return challengeModels;
  }

  Future<ChallengeModel> fetchChallengeById(int challengeId) async {
    final challenge = await (_database.select(_database.challenges)
          ..where((challenge) => challenge.id.equals(challengeId)))
        .getSingle();
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
