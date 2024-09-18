import 'package:drift/drift.dart';
import 'package:habit_tracker/data/local/tables/challenges_table.dart';

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get challengeId => integer().references(Challenges, #id)();
  TextColumn get name => text()();
  TextColumn get iconPath => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get colorHex => text()();
  TextColumn get description => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get cacheTimestamp => dateTime()();
}

class HabitRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer().references(Habits, #id)();
  IntColumn get dayCount => integer()();
  RealColumn get progress => real()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get cacheTimestamp => dateTime()();
}
