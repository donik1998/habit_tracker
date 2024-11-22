import 'package:habit_tracker/domain/repository/local_database_repository.dart';
import 'package:habit_tracker/domain/repository/remote_data_storage.dart';

bool outdatedPredicate(DateTime lastSynced) {
  return DateTime.now().difference(lastSynced).inDays > 1;
}

class SyncStep {
  final String name;
  final Future<void> Function() action;

  SyncStep({
    required this.name,
    required this.action,
  });
}

Future<void> syncOutdatedLocalData(List<SyncStep> steps) async {
  await Future.wait(
    steps.map(
      (step) => step.action().then((val) => print('Synced ${step.name}')),
    ),
  );
}

Future<void> syncData({
  required LocalDatabaseRepository localDatabaseRepository,
  required RemoteDataStorage remoteDataStorage,
}) async {
  final steps = [
    SyncStep(
      name: 'Challenges',
      action: () async {
        final challenges = await localDatabaseRepository.fetchAllChallenges();
        await remoteDataStorage.uploadChallenges(
          challenges.where((challenge) => outdatedPredicate(challenge.cacheTimestamp)).toList(),
        );
      },
    ),
    SyncStep(
      name: 'Habits',
      action: () async {
        final habits = await localDatabaseRepository.fetchAllHabits();
        await remoteDataStorage.uploadHabits(
          habits.where((habit) => outdatedPredicate(habit.cacheTimestamp)).toList(),
        );
      },
    ),
    SyncStep(
      name: 'Habit Progress',
      action: () async {
        final habitProgress = await localDatabaseRepository.fetchAllHabitProgress();
        await remoteDataStorage.uploadHabitProgress(
          habitProgress.where((progress) => outdatedPredicate(progress.cacheTimestamp)).toList(),
        );
      },
    ),
    SyncStep(
      name: 'Goal Groups',
      action: () async {
        final goalGroups = await localDatabaseRepository.fetchAllGoalGroups();
        await remoteDataStorage.uploadGoalGroups(
          goalGroups.where((group) => outdatedPredicate(group.cacheTimestamp)).toList(),
        );
      },
    ),
    SyncStep(
      name: 'Goals',
      action: () async {
        final goals = await localDatabaseRepository.fetchAllGoals();
        await remoteDataStorage.uploadGoals(
          goals.where((goal) => outdatedPredicate(goal.cacheTimestamp)).toList(),
        );
      },
    ),
  ];

  await syncOutdatedLocalData(steps);
}
