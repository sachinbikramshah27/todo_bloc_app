import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:todo_bloc_app/cubits/todo_list/todo_list_cubit.dart';

class ShowTodos extends StatefulWidget {
  const ShowTodos({super.key});

  @override
  State<ShowTodos> createState() => _ShowTodosState();
}

class _ShowTodosState extends State<ShowTodos> {
  late final TextEditingController editTodoController;

  @override
  void initState() {
    super.initState();
    editTodoController = TextEditingController();
  }

  @override
  void dispose() {
    editTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todosList = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: todosList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: ValueKey(todosList[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            onDismissed: (_) {
              context.read<TodoListCubit>().removeTodo(todosList[index]);
            },
            confirmDismiss: (_) {
              return showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                        title: Text('Delete Todo?'),
                        content: Text("Are you sure?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text("No"))
                        ]);
                  });
            },
            child: Container(
                height: 50,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) {
                          bool _error = false;
                          editTodoController.text =
                              todosList[index].description;
                          return StatefulBuilder(
                              builder: (_, StateSetter setState) {
                            return AlertDialog(
                                title: Text('Edit Todo'),
                                content: TextField(
                                  controller: editTodoController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    errorText:
                                        _error ? "Value cannot be empty" : null,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        /* context
                                            .read<TodoListCubit>()
                                            .state
                                            .todoList; */
                                        Navigator.pop(context);
                                      },
                                      child: Text("No")),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _error =
                                              editTodoController.text.isEmpty
                                                  ? true
                                                  : false;
                                          /*    context
                                              .read<TodoListCubit>()
                                              .editTodo(todosList[index].id,
                                                  editTodoController.text); */

                                          if (!_error) {
                                            if (editTodoController.text
                                                    .trim()
                                                    .length <=
                                                0) {
                                            } else {
                                              context
                                                  .read<TodoListCubit>()
                                                  .editTodo(todosList[index].id,
                                                      editTodoController.text);
                                            }
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text("Yes"))
                                ]);
                          });
                        });
                  },
                  leading: Checkbox(
                    value: todosList[index].completed,
                    onChanged: (bool? check) {
                      context
                          .read<TodoListCubit>()
                          .toggleTodo(todosList[index].id);
                    },
                  ),
                  title: Text(todosList[index].description),
                )));
      },
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment:
          (direction == 0) ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(Icons.delete),
    );
  }
}
