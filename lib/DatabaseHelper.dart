import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  String booksTable = 'books';
  String colId = 'id';
  String colTitle = 'title';
  String colImage = 'image';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'books.db');
    Database db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $booksTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colImage TEXT)');
  }

  Future<List<Map<String, dynamic>>> getBooksMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(booksTable);
    return result;
  }

  Future<int> insertBook(Book book) async {
    Database db = await this.db;
    final int result = await db.insert(booksTable, book.toMap());
    return result;
  }
}
