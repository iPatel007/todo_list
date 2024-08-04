import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../utilities/locator.dart';
import '../models/todo.dart';
import '../services/database_service.dart';
import '../services/navigation_servcie.dart';

class TodoDetailsViewModel extends BaseViewModel {
  final _databaseService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  int status = 0;

  Todo? finalTodo;

  init(Todo? todo){
    titleController.text = "";
    detailsController.text = "";
    finalTodo = null;
    status = 0;
    if (todo != null) {
      finalTodo = todo;
      titleController.text = todo.title;
      detailsController.text = todo.details;
      status = todo.status;
    }
  }

  Future<void> addTodo(Todo todo) async {
    await _databaseService.insertTodo(todo.toMap());
    popToTodoList();
  }

  Future<void> updateTodoStatus(Todo todo, int status) async {
    todo.status = status;
    await _databaseService.updateTodo(todo.toMap());
    popToTodoList();
  }

  Future<void> updateTodoDetails(Todo todo, String title, String details) async {
    todo.title = title;
    todo.details = details;
    await _databaseService.updateTodo(todo.toMap());
    popToTodoList();
  }

  popToTodoList(){
    _navigationService.pop(returnValue: true);
  }
  manageAddUpdateItem(){
    if (formKey.currentState!.validate()) {
      final newTodo = Todo(
        id: finalTodo?.id,
        title: titleController.text,
        details: detailsController.text,
        status: status,
      );

      if (finalTodo == null) {
        print("newTodo == $newTodo");
        addTodo(newTodo);
      } else {
        print("update == $newTodo");
        updateTodoDetails(
            newTodo, newTodo.title, newTodo.details);
      }
    }
  }

}
