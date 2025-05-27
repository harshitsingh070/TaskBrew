import 'package:flutter/material.dart';
import 'package:taskbrew/constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final ondeleteitem;

  const ToDoItem({
    super.key,
    required this.todo,
    this.onToDoChanged,
    this.ondeleteitem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E), // Background of the tile
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(255, 255, 255, 255), // Whitish border color
          width: 0.5,
        ),
      ),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.transparent, // prevent overriding Container's color
        leading: Icon(
          todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: todo.isDone ? Color(0xFF00C853) : Color(0xFFFF3C2F),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdGrey,
            fontWeight: FontWeight.bold,
            decoration: todo.isDone ? TextDecoration.lineThrough  : null,
             decorationColor: todo.isDone ? Color.fromARGB(255, 2, 255, 107) : null, // Green line-through
    decorationThickness: todo.isDone ? 4.0 : null, // Optional: makes it more visible
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Color(0xFFFF6347),
            borderRadius: BorderRadius.circular(3),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              ondeleteitem(todo.id);
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
