import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDescription) {
    final newTodo = TodoModel(description: todoDescription);
    final newTodos = [...state.todoList, newTodo];
    emit(state.copyWith(todoList: newTodos));
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = state.todoList.map((TodoModel todoModel) {
      if (todoModel.id == id) {
        return TodoModel(description: todoDesc, completed: todoModel.completed);
      }
      return todoModel;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todoList.map((TodoModel todoModel) {
      if (todoModel.id == id) {
        return TodoModel(
            id: id,
            description: todoModel.description,
            completed: !todoModel.completed);
      }
      return todoModel;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void removeTodo(TodoModel todoModel) {
    final newTodos =
        state.todoList.where((TodoModel t) => t.id != todoModel.id).toList();
    emit(state.copyWith(todoList: newTodos));
  }
}
