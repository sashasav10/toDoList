class Todo {
  Todo({
    required this.id,
    required this.name,
    required this.checked,
    this.isEdit = false,
  });

  final String id;
  final String name;
  final bool checked;
  bool isEdit;

  Todo copyWith({String? id, String? name, bool? checked}) => Todo(
        id: id ?? this.id,
        name: name ?? this.name,
        checked: checked ?? this.checked,
      );

  static fromJson(Map<String, dynamic> jsonData) {
    return Todo(
      id: jsonData['id'],
      name: jsonData['name'],
      checked: jsonData['checked'],
      isEdit: jsonData['isEdit'],
    );
  }

  static Map<String, dynamic> toMap(Todo todo) => {
        'id': todo.id,
        'name': todo.name,
        'checked': todo.checked,
        'isEdit': todo.isEdit,
      };
}
