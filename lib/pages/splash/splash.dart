import 'package:flutter/material.dart';
import 'package:todo_app/utilities/routes/route_name.dart';

import '../../core/services/navigation_servcie.dart';
import '../../utilities/const/color.dart';
import '../../utilities/const/image.dart';
import '../../utilities/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _navigationService = locator<NavigationService>();

  @override
  void initState() {
    _loadHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorPrimary,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: Image.asset(appIcon, fit: BoxFit.contain))));
  }

  _loadHomeScreen() {
    Future.delayed(const Duration(milliseconds: 3500), () async {
      _navigationService.pushReplacementNamed(TodoListPageRoute);
    });
  }
}
