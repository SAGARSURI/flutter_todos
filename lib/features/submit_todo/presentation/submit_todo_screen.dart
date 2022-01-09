import 'package:flutter/material.dart';
import 'package:flutter_todos/features/submit_todo/presentation/resource/constant.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field.dart';

import 'widgets/todo_title_field/todo_title_field.dart';

class SubmitTodoScreen extends StatelessWidget {
  const SubmitTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TodoTitleField(
              key: titleFieldKey,
            ),
            const SizedBox(height: 8),
            TodoDateField(
              key: dateFieldKey,
            ),
            const SizedBox(height: 8),
            TextField(
              key: noteFieldKey,
              decoration: InputDecoration(
                hintText: 'Note',
              ),
              minLines: 5,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
