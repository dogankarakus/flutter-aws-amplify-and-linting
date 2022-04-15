import 'package:flutter/cupertino.dart';
import 'package:flutter_with_aws/models/ModelProvider.dart';
import 'TodoItem.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  TodosList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return todos.length >= 1
        ? ListView(
            children: todos.map((todo) => TodoItem(todo: todo)).toList(),
          )
        : Center(child: Text('Tap button below to add a todo!'));
  }
}
