import 'package:flutter/material.dart';
import 'search_filtered_todo.dart';
import 'show_todos.dart';
import 'todo_create.dart';
import 'todo_header.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TodoHeader(),
            CreateTodo(),
            SizedBox(
              height: 20.0,
            ),
            SearchAndFilteredTodo(),
            SizedBox(
              height: 20.0,
            ),
            ShowTodos(),
          ],
        ),
      ),
    ));
  }
}
