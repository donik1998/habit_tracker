import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:habit_tracker/data/local/tables/challenges_table.dart';
import 'package:habit_tracker/data/local/tables/goals.dart';
import 'package:habit_tracker/data/local/tables/habits_table.dart';

part 'local_data_storage.g.dart';

@DriftDatabase(tables: [Challenges, GoalsGroup, Goals, Habits, HabitRecords])
class LocalDatabase extends _$LocalDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'content_database');
  }
}
