class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'Morning exercise', isDone: true),
      Todo(id: '02', todoText: 'breakfast', isDone: true),
      Todo(id: '03', todoText: 'Team Meating'),
      Todo(id: '04', todoText: 'Practice Flutter'),
    ];
  }
}
