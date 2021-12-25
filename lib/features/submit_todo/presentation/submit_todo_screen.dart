import 'package:flutter/material.dart';
import 'package:flutter_todos/features/submit_todo/presentation/resource/constant.dart';

class SubmitTodoScreen extends StatelessWidget {
  const SubmitTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            key: titleFieldKey,
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            key: dateFieldKey,
            decoration: InputDecoration(
              hintText: 'Date',
            ),
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 8),
          TextField(
            key: noteFieldKey,
            decoration: InputDecoration(
              hintText: 'Note',
            ),
            minLines: 2,
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
    );
  }
}
