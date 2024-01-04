import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/cubits/cubits.dart';

class TodoHeader extends StatefulWidget {
  const TodoHeader({super.key});

  @override
  State<TodoHeader> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends State<TodoHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Todo"),
        Text(
            '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left'),
      ],
    );
  }
}
