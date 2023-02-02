class Todo {
  Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.checked,
    this.isEdit = false,
    this.photo,
  });

  final String id;
  final String name;
  final String description;
  final bool checked;
  final bool isEdit;
  final String? photo;

  Todo? copyWith({
    String? id,
    String? name,
    String? description,
    bool? checked,
    bool? isEdit,
    String? photo,
  }) =>
      Todo(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        checked: checked ?? this.checked,
        isEdit: isEdit ?? this.isEdit,
        photo: photo ?? this.photo,
      );

  static fromJson(Map<String, dynamic> jsonData) {
    return Todo(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      checked: jsonData['checked'],
      isEdit: jsonData['isEdit'],
      photo: jsonData['photo'],
    );
  }

  static Map<String, dynamic> toMap(Todo todo) => {
        'id': todo.id,
        'name': todo.name,
        'description': todo.description,
        'checked': todo.checked,
        'isEdit': todo.isEdit,
        'photo': todo.photo,
      };
}
