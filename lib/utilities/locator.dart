import 'package:get_it/get_it.dart';
import '../core/services/database_service.dart';
import '../core/services/navigation_servcie.dart';
import '../core/viewmodels/todo_detail_viewmodel.dart';
import '../core/viewmodels/todo_viewmodel.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  _setupServices();
  _setupViewModels();
}

Future _setupServices() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
}

Future _setupViewModels() async {
  locator.registerLazySingleton<TodoViewModel>(() => TodoViewModel());
  locator.registerLazySingleton<TodoDetailsViewModel>(() => TodoDetailsViewModel());
}