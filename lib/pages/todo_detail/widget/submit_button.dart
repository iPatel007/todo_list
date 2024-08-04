import 'package:flutter/material.dart';

import '../../../core/models/todo.dart';
import '../../../core/viewmodels/todo_detail_viewmodel.dart';
import '../../../utilities/const/color.dart';
import '../../../utilities/locator.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget({super.key});
  final model = locator<TodoDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: kColorSecondary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold)
      ),
      onPressed: () {
        model.manageAddUpdateItem();
      },
      child: Text((model.finalTodo == null ? 'Add Task' : 'Update Task').toUpperCase()),
    );
  }
}
