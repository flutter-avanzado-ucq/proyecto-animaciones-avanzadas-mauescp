// tarea_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widgets/card_tarea.dart';
import '../widgets/header.dart';
import '../widgets/add_task_sheet.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _tasks = [];
  late AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _addTask(String task) {
    setState(() {
      _tasks.insert(0, {'title': task, 'done': false});
    });
    // Ejecuta animación inversa del ícono después de añadir una nueva tarea
    _iconController.reverse();
  }

  void _toggleComplete(int index) {
    setState(() {
      _tasks[index]['done'] = !_tasks[index]['done'];
    });
    // Ejecuta animación del ícono al cambiar el estado de completado de una tarea
    _iconController.forward(from: 0);
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddTaskSheet() {
    // Ejecuta animación del ícono al abrir el formulario para agregar tareas
    _iconController.forward();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AddTaskSheet(onSubmit: _addTask),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              // Usa AnimationLimiter para evitar que las animaciones se repitan al hacer scroll
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: TaskCard(
                            title: task['title'],
                            isDone: task['done'],
                            onToggle: () => _toggleComplete(index),
                            onDelete: () => _removeTask(index),
                            iconRotation: _iconController,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskSheet,
        backgroundColor: const Color.fromARGB(255, 31, 20, 49),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        // Muestra un ícono animado que cambia entre “añadir” y “evento” según el progreso
        child: AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: _iconController,
        ),
      ),
    );
  }
}
