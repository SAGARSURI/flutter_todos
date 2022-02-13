import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Icon(
              Icons.check_circle_outline_sharp,
              size: size.width * 0.2,
            ),
          ),
          ElevatedButton(
            child: Text('Done'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
