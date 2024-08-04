import 'package:flutter/material.dart';
import 'package:todo_app/utilities/locator.dart';
import 'package:todo_app/utilities/utils.dart';

import '../../../core/viewmodels/todo_viewmodel.dart';
import 'no_data_found.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({super.key});
  final model = locator<TodoViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: (model.todos ?? []).isEmpty
          ? const NoDataFoundWidget()
          : ListView.builder(
              itemCount: model.todos?.length,
              itemBuilder: (context, index) {
                final todo = model.todos?[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Dismissible(
                    key: UniqueKey(),
                    confirmDismiss: (DismissDirection direction) =>
                        Utils.openAlertDialogTwoOpt(
                            "Are you sure you want to delete this task?",
                            context),
                    onDismissed: (direction) {
                      model.deleteTodoById(todo?.id ?? 0, index);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Task has been deleted!')));
                    },
                    // Show a red background as the item is swiped away.
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(
                        todo?.title ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      subtitle: Text(todo?.details ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey)),
                      trailing: _buildStatusIndicator(todo?.status ?? 0),
                      onTap: () async {
                        model.pushToDetailView(todo: todo);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildStatusIndicator(int status) {
    Color color;
    String txtStatus;
    switch (status) {
      case 1:
        color = Colors.orange;
        txtStatus = "In Progress";
        break;
      case 2:
        color = Colors.green;
        txtStatus = "Completed";
        break;
      default:
        color = Colors.grey;
        txtStatus = "Not Started";
        break;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: color,
          ),
        ),
        Text(txtStatus,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: color))
      ],
    );
  }
}
