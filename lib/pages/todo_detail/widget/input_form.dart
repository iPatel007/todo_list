import 'package:flutter/material.dart';
import 'package:todo_app/core/viewmodels/todo_detail_viewmodel.dart';
import 'package:todo_app/pages/todo_detail/widget/submit_button.dart';
import 'package:todo_app/utilities/locator.dart';

import '../../../core/models/todo.dart';
import '../../../utilities/const/color.dart';
import '../../../utilities/utils.dart';

class InputFormWidget extends StatelessWidget {
  InputFormWidget({super.key});
  final model = locator<TodoDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: model.titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          Utils.verticalSpace(12),
          TextFormField(
            controller: model.detailsController,
            decoration: const InputDecoration(labelText: 'Details'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter details';
              }
              return null;
            },
          ),
          Utils.verticalSpace(12),
          DropdownButtonFormField<int>(
            value: model.status,
            onChanged: (value) {
              model.status = value!;
            },
            decoration: const InputDecoration(labelText: 'Status'),
            items: const [
              DropdownMenuItem(value: 0, child: Text('Not Started')),
              DropdownMenuItem(value: 1, child: Text('In Progress')),
              DropdownMenuItem(value: 2, child: Text('Completed')),
            ],
            validator: (value) {
              if (value == null) {
                return 'Please select a status';
              }
              return null;
            },
          ),
          Utils.verticalSpace(40),
          SubmitButtonWidget(),
          Utils.verticalSpace(12)
        ],
      ),
    );
  }
}
