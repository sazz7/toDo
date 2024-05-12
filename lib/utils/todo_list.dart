import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20,bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              padding: EdgeInsets.all(40),
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.redAccent,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.black,
                side: BorderSide(color: Colors.white),
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  decoration: taskCompleted?
                  TextDecoration.underline: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
