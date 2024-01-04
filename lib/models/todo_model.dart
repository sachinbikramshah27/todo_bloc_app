import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
enum Filter{
  all,
  active,
  completed,
}
Uuid uuid = Uuid();


class TodoModel extends Equatable {
  final String id;
  final String description;
  final bool completed;
  TodoModel({
    String? id,
    required this.description,
    this.completed = false,
  }) : this.id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, description, completed];

  @override
  String toString() =>
      'TodoModel(id: $id, description: $description, completed: $completed)';
}
