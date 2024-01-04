part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todoList;
  TodoListState({
    required this.todoList,
  });

  factory TodoListState.initial() {
    return TodoListState(todoList: [
      /* TodoModel(id: "1", description: "Buy groceries"),
      TodoModel(id: "2", description: "Eat Food"), */
    ]);
  }

  @override
  String toString() => 'TodoListState(todoList: $todoList)';

  TodoListState copyWith({
    List<TodoModel>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object> get props => [todoList];
}
