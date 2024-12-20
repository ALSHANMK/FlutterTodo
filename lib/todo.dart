class Todo {
  String? id;
  String? task;
  bool isdone = false;

  Todo({
    required this.id,
    required this.task,
    this.isdone = false,
  });

  static List<Todo> todolist() {
    return [
      Todo(id: "1", task: "grocery", isdone: true),
      Todo(id: "2", task: "GYM", isdone: true),
      Todo(
        id: "3",
        task: "Work",
      ),
    ];
  }
}
