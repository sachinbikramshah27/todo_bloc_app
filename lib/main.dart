import 'package:flutter/material.dart';
import 'cubits/cubits.dart';
import 'pages/todo_Pages/todos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoFilterCubit>(
            create: (context) => TodoFilterCubit(),
          ),
          BlocProvider<TodoListCubit>(
            create: (context) => TodoListCubit(),
          ),
          BlocProvider<TodoSearchCubit>(
            create: (context) => TodoSearchCubit(),
          ),
          BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
              todoListCubit: BlocProvider.of<TodoListCubit>(context),
              //context.read<TodoListCubit>()
            ),
          ),
          BlocProvider<FilteredTodosCubit>(
            create: (context) => FilteredTodosCubit(
                todoListCubit: BlocProvider.of<TodoListCubit>(context),
                todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
                todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Todo Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: TodosPage(),
        ));
  }
}
