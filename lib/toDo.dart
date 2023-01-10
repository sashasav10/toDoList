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
}
