import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'task.dart';

class TodoLocalDatabase {
  static const String _tableName = "tasks";
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'todo_database.db');
    const String sql = '''
  CREATE TABLE $_tableName(
  id INTEGER, 
  title TEXT, 
  note TEXT,
  dueDate INTEGER,
  reminder INTEGER,
  isImportant INTEGER,
  isCompleted INTEGER
  )
  ''';
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(sql);
    }, onOpen: (Database database) {
      debugPrint("database is opened");
    });
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final tasksTable = await db.query(_tableName);
    return List.generate(tasksTable.length, (index) {
      return Task(
        id: tasksTable[index]['id'] as int,
        title: tasksTable[index]['title'] as String,
        note: tasksTable[index]['note'] as String,
        dueDate: tasksTable[index]['dueDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                tasksTable[index]['dueDate'] as int)
            : null,
        reminder: tasksTable[index]['reminder'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                tasksTable[index]['reminder'] as int)
            : null,
        isImportant: tasksTable[index]['isImportant'] == 1 ? true : false,
      );
    });
  }

  Future<void> addTask(Task task) async {
    final db = await database;
    await db.insert(_tableName, task.toMap());
    debugPrint("task is added");
  }

  Future<void> completeTask(Task task) async {
    final db = await database;
    task.isCompleted = true;
    await db.update(_tableName, task.toMap(),
        where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> deleteTask(Task task) async {
    final db = _database!;
    await db.delete(_tableName, where: "id = ?", whereArgs: [task.id]);
  }
}
