import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/src/di/todo_database_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_screen.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_screen.dart';
import 'package:go_router/go_router.dart';

import 'router/route_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await initTodoDatabase();
  runApp(
    ProviderScope(
      overrides: [
        todoDatabaseProvider.overrideWithValue(store),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: homeRoute,
        path: '/',
        builder: (context, state) => TodoListScreen(
          navigateToSubmitTodoScreen: (context) {
            context.pushNamed(submitTodoScreenRoute);
          },
        ),
      ),
      GoRoute(
        name: submitTodoScreenRoute,
        path: '/submitTodo',
        builder: (context, state) => SubmitTodoScreen(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const Text('Wrong page'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      theme: FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mandyRed).toTheme,
      themeMode: ThemeMode.system,
    );
  }
}
