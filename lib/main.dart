import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/core/services/navigation_servcie.dart';
import 'package:todo_app/utilities/locator.dart';
import 'package:todo_app/utilities/routes/route_name.dart';
import 'package:todo_app/utilities/routes/route_screen.dart' as newRouter;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListPage(),
      navigatorKey: locator<NavigationService>().navigationKey,
      initialRoute: SplashPageRoute,
      onGenerateRoute: (settings) =>
          newRouter.Router.generateRoute(context, settings),
    );
  }
}


