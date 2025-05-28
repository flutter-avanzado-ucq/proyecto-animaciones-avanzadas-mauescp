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
    // Reversa la animación del ícono cuando se agrega una tarea
    _iconController.reverse(); // Comentario agregado
  }

  void _toggleComplete(int index) {
    setState(() {
      _tasks[index]['done'] = !_tasks[index]['done'];
    });
    // Inicia animación del ícono al marcar como completado
    _iconController.forward(from: 0); // Comentario agregado
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddTaskSheet() {
    // Inicia animación al mostrar el modal
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
              // Previene que las animaciones se repitan al hacer scroll
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
                          child: Dismissible(
                            key: UniqueKey(), // Cambiado para garantizar claves únicas
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              _removeTask(index); // Simplificado para eliminar inmediatamente
                            },
                            background: Container(
                              color: const Color.fromARGB(255, 196, 40, 29),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: TaskCard(
                              title: task['title'],
                              isDone: task['done'],
                              onToggle: () => _toggleComplete(index),
                              onDelete: () => _removeTask(index),
                              iconRotation: _iconController,
                            ),
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
        child: AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: _iconController,
        ),
      ),
    );
  }
}