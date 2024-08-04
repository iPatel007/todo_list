import 'package:flutter/material.dart';

import '../../../core/viewmodels/todo_viewmodel.dart';
import '../../../utilities/const/color.dart';
import '../../../utilities/locator.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({super.key});
  final model = locator<TodoViewModel>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: Colors.white,
      tooltip: "Click to add new TODO item",
      child: const Icon(Icons.add, color: kColorPrimary),
      onPressed: () {
        model.pushToDetailView();
      },
    );
  }
}
