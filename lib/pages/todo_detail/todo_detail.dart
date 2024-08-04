import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/core/viewmodels/todo_detail_viewmodel.dart';
import 'package:todo_app/pages/todo_detail/widget/input_form.dart';
import 'package:todo_app/utilities/const/color.dart';
import 'package:todo_app/utilities/const/text_style.dart';
import 'package:todo_app/utilities/utils.dart';
import '../../core/models/todo.dart';
import '../../utilities/locator.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage({super.key, this.todo});
  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoDetailsViewModel>.reactive(
      viewModelBuilder: () => locator<TodoDetailsViewModel>(),
      onViewModelReady: (model) => model.init(todo),
      disposeViewModel: false,
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            Utils.hideKeyboard(context);
          },
          child: Scaffold(
            backgroundColor: kColorPrimary,
            appBar: AppBar(
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              backgroundColor: kColorPrimary,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      todo == null ? 'Add New Task' : 'Edit Task',
                      style: txtStyleLargeAppBar,
                    ),
                    Utils.verticalSpace(20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: InputFormWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
