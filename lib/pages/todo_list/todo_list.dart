import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/pages/todo_list/widget/floating_button.dart';
import 'package:todo_app/pages/todo_list/widget/list_widget.dart';
import 'package:todo_app/utilities/const/color.dart';
import 'package:todo_app/utilities/locator.dart';
import '../../core/viewmodels/todo_viewmodel.dart';
import '../../utilities/const/text_style.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: () => locator<TodoViewModel>(),
      onViewModelReady: (model) => model.fetchTodos(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: kColorPrimary,
          floatingActionButton: FloatingButton(),
          appBar: AppBar(
            backgroundColor: kColorPrimary,
            title: const Text(
              'Todo List',
              style: txtStyleAppBar
            ),
            centerTitle: true,
          ),
          body: model.isFetchingRecord ? const Offstage(): TodoListWidget(),
        );
      },
    );
  }
}
