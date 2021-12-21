import 'package:flutter/material.dart';

class NoTodoWidget extends StatelessWidget {
  const NoTodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No todos found',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
