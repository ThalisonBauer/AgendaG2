import 'dart:async';
import 'package:AgendaG2/repositories/todo_repository_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../entitys/todo_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [TodoEntity])
abstract class AppDatabase extends FloorDatabase {
  TodoRepositoryDao get todoRepositoryDao;
}
