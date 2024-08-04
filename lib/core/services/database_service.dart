import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<int> insertTodo(Map<String, dynamic> todo);
  Future<List<Map<String, dynamic>>> getTodos();
  Future<int> updateTodo(Map<String, dynamic> todo);
  Future<int> deleteTodoById(int id);
}

class DatabaseServiceImpl implements DatabaseService{

  static final DatabaseServiceImpl _instance = DatabaseServiceImpl._internal();
  factory DatabaseServiceImpl() => _instance;
  DatabaseServiceImpl._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            details TEXT,
            status INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE todos ADD COLUMN details TEXT');
          await db.execute('ALTER TABLE todos ADD COLUMN status INTEGER DEFAULT 0');
        }
      },
    );
  }

  @override
  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final db = await database;
    return await db.insert('todos', todo);
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await database;
    return await db.query('todos');
  }

  @override
  Future<int> updateTodo(Map<String, dynamic> todo) async {
    final db = await database;
    return await db.update('todos', todo, where: 'id = ?', whereArgs: [todo['id']]);
  }

  @override
  Future<int> deleteTodoById(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
