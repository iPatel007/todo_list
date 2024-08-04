class Todo {
  int? id;
  String title;
  String details;
  int status; // 0: Not Started, 1: In Progress, 2: Completed

  Todo({
    this.id,
    required this.title,
    required this.details,
    this.status = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'details': details,
      'status': status,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      details: map['details'],
      status: map['status'],
    );
  }
}
