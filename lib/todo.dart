import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.checked,
    this.isEdit = false,
    this.photo,
    this.isHistory = false,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool checked;
  @HiveField(4)
  final bool isEdit;
  @HiveField(5)
  final String? photo;
  @HiveField(6)
  final bool isHistory;

  Todo? copyWith({
    String? id,
    String? name,
    String? description,
    bool? checked,
    bool? isEdit,
    String? photo,
    bool? isHistory,
  }) =>
      Todo(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        checked: checked ?? this.checked,
        isEdit: isEdit ?? this.isEdit,
        photo: photo ?? this.photo,
        isHistory: isHistory ?? this.isHistory,
      );

  static fromJson(Map<String, dynamic> jsonData) {
    return Todo(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      checked: jsonData['checked'],
      isEdit: jsonData['isEdit'],
      photo: jsonData['photo'],
      isHistory: jsonData['isHistory'],
    );
  }

  static Map<String, dynamic> toMap(Todo todo) => {
        'id': todo.id,
        'name': todo.name,
        'description': todo.description,
        'checked': todo.checked,
        'isEdit': todo.isEdit,
        'photo': todo.photo,
        'isHistory': todo.isHistory,
      };
}
