import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todoitem.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = Todo.todolist();
  final Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todo App",
            style: TextStyle(color: Colors.lime),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Sample Todo List",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: Controller,
                        decoration: InputDecoration(
                          hintText: "Add Items Here",
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        ontap(Controller.text);
                      },
                      child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.blueAccent,
                          iconColor: Colors.orange),
                    ),
                  ),
                ],
              ),
              for (Todo todoo in todoslist)
                Todoitem(
                  todo: todoo,
                  ondlt: ondlt,
                  ontap: ontap,
                  onprsd: onprsd,
                ),
            ],
          ),
        ));
  }

  void ondlt(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void onprsd(Todo todo) {
    setState(() {
      todo.isdone = !todo.isdone;
    });
  }

  void ontap(String todo) {
    setState(() {
      todoslist.add(
        Todo(id: DateTime.now().microsecondsSinceEpoch.toString(), task: todo),
      );
    });
    Controller.clear();
  }
}
