import 'package:flutter/material.dart';

class Task {
  String title;
  bool done;
  DateTime? dueDate; // Agregar la fecha de vencimiento

  Task({required this.title, this.done = false, this.dueDate});
}

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, {DateTime? dueDate}) {
    _tasks.insert(0, Task(title: title, dueDate: dueDate));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].done = !_tasks[index].done;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
