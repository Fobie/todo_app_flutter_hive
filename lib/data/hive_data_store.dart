import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
import '../models/task.dart';

class HiveDataStore {
  static const boxName = "taskBox";
  final Box<Task> box = Hive.box<Task>(boxName);

  /// Add new Task                  ***  C  ***
  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  /// Show task                     ***  R  ***
  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  /// Update task                  ***  U  ***
  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  /// Delete task                 ***  D  ***
  Future<void> daleteTask({required Task task}) async {
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}
