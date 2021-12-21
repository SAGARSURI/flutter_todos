import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/src/di/todo_database_provider.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_screen.dart';
import 'package:go_router/go_router.dart';

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

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          child: TodoListScreen(),
        ),
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
      routerDelegate: _router.routerDelegate,
      theme: FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mandyRed).toTheme,
      themeMode: ThemeMode.system,
    );
  }
}
