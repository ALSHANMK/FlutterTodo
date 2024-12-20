import 'package:flutter/material.dart';
import 'package:todo_app/Home.dart';
import 'package:todo_app/todo.dart';

class Todoitem extends StatelessWidget {
  final Home hme = new Home();
  final Todo todo;
  final ontap;
  final ondlt;
  final onprsd;

  Todoitem(
      {super.key,
      required this.todo,
      required this.ontap,
      required this.ondlt,
      required this.onprsd});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              tileColor: Colors.black,
              textColor: Colors.white,
              leading: IconButton(
                  icon: Icon(
                    color: Colors.white,
                    todo.isdone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                  onPressed: () {
                    onprsd(todo);
                  }),
              title: Text(
                todo.task!,
                style: TextStyle(
                  decoration: todo.isdone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                  fill: 1,
                ),
                onPressed: () => ondlt(todo.id),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
