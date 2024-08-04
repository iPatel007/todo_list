import 'package:stacked/stacked.dart';
import 'package:todo_app/utilities/routes/route_name.dart';
import '../../utilities/locator.dart';
import '../models/todo.dart';
import '../services/database_service.dart';
import '../services/navigation_servcie.dart';

class TodoViewModel extends BaseViewModel {
  final _databaseService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  bool _isFetchingRecord = false;
  bool get isFetchingRecord => _isFetchingRecord;
  set isFetchingRecord(bool flag) {
    _isFetchingRecord = flag;
    notifyListeners();
  }

  Future<void> fetchTodos() async {
    _isFetchingRecord = true;
    _todos.clear();
    final todoMaps = await _databaseService.getTodos();
    _todos = todoMaps.map((map) => Todo.fromMap(map)).toList();
    _isFetchingRecord = false;
    notifyListeners();
  }

  Future<void> deleteTodoById(int id, int index) async {
    await _databaseService.deleteTodoById(id);
    _todos.removeAt(index);
    notifyListeners();
  }

  pushToDetailView({Todo? todo}) async {
    bool? isUpdate = await _navigationService.pushNamed(TodoDetailsPageRoute,
        arguments: todo);
    if ((isUpdate ?? false) == true) {
      fetchTodos();
    }
  }
}
