// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_aws/models/ModelProvider.dart';

class TodoItem extends StatelessWidget {
  final double iconSize = 24.0;
  final Todo todo;

  TodoItem({required this.todo});

  void _deleteTodo(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(todo);
    } catch (e) {
      print('An error occurred while deleting Todo: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    Todo updatedTodo = todo.copyWith(
        isCompleted: !todo.isCompleted,
        description: todo.description,
        id: todo.id,
        name: todo.name);
    try {
      // to update data in DataStore, we again pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      print('An error occurred while saving Todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24.0, right: 24.0, top: 12, bottom: 12),
      child: Container(
        width: MediaQuery.of(context).size.width - 48.0,
        height: 70,
        decoration: BoxDecoration(
            color: Color(0xffFAFBFC),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0xff303030).withOpacity(0.25),
                offset: Offset(0, 4),
              )
            ]),
        child: InkWell(
          onTap: () {
            _toggleIsComplete();
          },
          onLongPress: () {
            _deleteTodo(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 1.0,
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: SizedBox(
                  height: 58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 29,
                        child: Text(todo.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303030)),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        height: 29,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          todo.description,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff303030)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                todo.isCompleted
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: iconSize,
                color: Color(0xff8C9EFF),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
