
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/pages/splash/splash.dart';
import 'package:todo_app/pages/todo_detail/todo_detail.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/utilities/routes/route_name.dart';

class Router {
  static String currentScreenName = "";

  static Route<dynamic> generateRoute(
      BuildContext context,
      RouteSettings settings,
      ) {
    return MaterialPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateRoute(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    routeName(settings.name);
    switch (settings.name) {
      case SplashPageRoute:
        return const SplashPage();
      case TodoListPageRoute:
        return const TodoListPage();
      case TodoDetailsPageRoute:
        return TodoDetailsPage(todo: (arguments == null) ? null : arguments as Todo);
      default:
        return Scaffold(
          body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    ),
                textAlign: TextAlign.center,
              )),
        );
    }
  }

  static String routeName(String? name) {
    currentScreenName = name ?? "";
    return currentScreenName;
  }

  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}