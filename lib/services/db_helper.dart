// db_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/visitor_table.dart';
import '../models/visitor.dart' as visitor_model;

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'visitors.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableVisitor (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT,
            $columnContact TEXT,
            $columnPurpose TEXT,
            $columnCheckIn TEXT,
            $columnCheckOut TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertVisitor(visitor_model.Visitor visitor) async {
    final dbClient = await db;
    return await dbClient.insert(tableVisitor, visitor.toMap());
  }

  Future<List<visitor_model.Visitor>> getVisitors() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps =
        await dbClient.query(tableVisitor, orderBy: '$columnId DESC');
    return maps.map((map) => visitor_model.Visitor.fromMap(map)).toList();
  }

  Future<int> updateVisitor(visitor_model.Visitor visitor) async {
    final dbClient = await db;
    return await dbClient.update(
      tableVisitor,
      visitor.toMap(),
      where: '$columnId = ?',
      whereArgs: [visitor.id],
    );
  }

  Future<int> deleteVisitor(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      tableVisitor,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
