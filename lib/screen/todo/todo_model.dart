class TodoModel {
  String name;
  bool complete;

  TodoModel({required this.name, required this.complete});

  @override
  String toString() {
    return 'TodoModel{name: $name, complete: $complete}';
  }
}