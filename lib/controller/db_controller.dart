import 'package:get/get.dart';

import '../model/database.dart';
import '../model/task.dart';

class DbController extends GetxController {
  static final database = TodoLocalDatabase();

  Future<List<Task>> get tasks async {
    List<Task> tasksList = await getTask();
    print('${tasksList.runtimeType}');
    return tasksList;
  }

  Future<List<Task>> getTask() async {
    return await database.getTasks();
  }

  Future<void> addTask(Task task) async {
    await database.addTask(task);
    notifyChildrens();
  }

  Future<void> completeTask(Task task) async {
    database.completeTask(task);
  }

  Future<void> deleteTask(Task task) async {
    database.deleteTask(task);
  }
}
