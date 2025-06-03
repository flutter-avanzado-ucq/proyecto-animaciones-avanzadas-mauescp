import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final Animation<double> iconRotation;
  final DateTime? vencimiento;

  const TaskCard({
    super.key,
    required this.title,
    required this.isDone,
    required this.onToggle,
    required this.onDelete,
    required this.iconRotation,
    required this.vencimiento,
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
                  ? const Color.fromARGB(255, 226, 130, 207)
                  : Colors.orangeAccent,
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
                  angle: isDone ? pi : 0,
                  child: Icon(
                    isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                    color:
                        isDone
                            ? const Color.fromARGB(255, 37, 124, 223)
                            : const Color.fromARGB(255, 97, 104, 58),
                  ),
                );
              },
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
              fontSize: 18,
              color: isDone ? Colors.black54 : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle:
              vencimiento != null
                  ? Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Vence: ${DateFormat('dd/MM/yyyy').format(vencimiento!)}',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  )
                  : null,
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
