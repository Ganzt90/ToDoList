import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  
  TodoTile({
    super.key, 
    required this.TaskName, 
    required this.TaskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              )
            ]),
        child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                // CheckBox
                Checkbox(
                  value: TaskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  ),
                // Task Name
                Text(
                  TaskName,
                  style: TextStyle(decoration: TaskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                  ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12)
              ),
          ),
      ),
    );
  }
}