import 'package:drift/drift.dart';

class GoalsGroup extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get iconPath => text()();
  DateTimeColumn get cacheTimestamp => dateTime()();
}

class Goals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(GoalsGroup, #id)();
  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get cacheTimestamp => dateTime()();
}
