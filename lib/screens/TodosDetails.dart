import 'package:flutter/material.dart';
import 'homePage.dart';

class TodosDetails extends StatelessWidget {
  const TodosDetails({super.key, required this.todo});
  
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(todo.title),Text(todo.description)],
        )
      )
      );
  }
}