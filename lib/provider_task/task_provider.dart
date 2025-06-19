import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class Task {
  String title;
  bool done;
  DateTime? dueDate;

  Task({required this.title, this.done = false, this.dueDate});
}

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, {DateTime? dueDate}) {
    final task = Task(title: title, dueDate: dueDate);
    _tasks.insert(0, task);

    // Programar una notificación si la tarea tiene fecha de vencimiento
    if (dueDate != null) {
      NotificationService.scheduleNotification(
        title: 'Recordatorio de tarea',
        body: 'La tarea "$title" vence hoy.',
        scheduledDate: dueDate,
      );
    }

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

  void updateTask(int index, String newTitle, {DateTime? newDate}) {
    final task = _tasks[index];
    task.title = newTitle;
    task.dueDate = newDate;

    // Reprogramar la notificación si se cambia la fecha de vencimiento
    if (newDate != null) {
      NotificationService.scheduleNotification(
        title: 'Actualización de tarea',
        body: 'La tarea "$newTitle" vence hoy.',
        scheduledDate: newDate,
      );
    }

    notifyListeners();
  }
}