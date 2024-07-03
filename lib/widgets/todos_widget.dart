import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/models/todo.dart';

class TodosWidget extends StatelessWidget {
  const TodosWidget({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: MediaQuery.of(context).padding.top,
      onRefresh: () async {
        await BlocProvider.of<TodosCubit>(context).getAllTodos();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: todos.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  todos[index].id.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              title: Text(todos[index].title),
              trailing: todos[index].completed
                  ? Icon(
                      Icons.done,
                      color: Theme.of(context).primaryColor,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
