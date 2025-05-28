import 'dart:math';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final Animation<double> iconRotation;

  const TaskCard({
    super.key,
    required this.title,
    required this.isDone,
    required this.onToggle,
    required this.onDelete,
    required this.iconRotation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: isDone ? 0.6 : 1.0,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isDone
                  ? const Color.fromARGB(255, 156, 107, 146) // Color MORADO cuando la tarea está completada 26 DE MAYO
                  : const Color.fromARGB(255, 174, 110, 25), //  Color NARANJA cuando la tarea es nueva 26 DE MAYO
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: onToggle,
            child: AnimatedBuilder(
              animation: iconRotation,
              builder: (context, child) {
                return Transform.rotate(
                  angle:
                      isDone
                          ? pi
                          : 0, // Gira 180° cuando está completada 26 DE MAYO
                  child: Icon(
                    isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                    color:
                        isDone
                            ? const Color.fromARGB(255, 37, 223, 68)
                            : const Color.fromARGB(255, 235, 158, 4),
                  ),
                );
              },
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone ? Colors.black54 : Colors.black87,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}