class Task {
  final int id;
  String title;
  String? note;
  DateTime? dueDate;
  DateTime? reminder;
  bool isImportant;
  bool isCompleted = false;

  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.dueDate,
    required this.reminder,
    required this.isImportant,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'dueDate': dueDate,
      'reminder': reminder,
      'isImportant': isImportant == true ? 1 : 0,
      'isCompleted': isCompleted == true ? 1 : 0
    };
  }

  void change(
    int? id,
    String? title,
    String? note,
    bool? isCompleted,
    DateTime? dueDate,
    DateTime? reminder,
    bool? isImportant,
    DateTime? creationDate,
  ) {
    Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      dueDate: dueDate ?? this.dueDate,
      reminder: reminder ?? this.reminder,
      isImportant: isImportant ?? this.isImportant,
    );
  }
}
