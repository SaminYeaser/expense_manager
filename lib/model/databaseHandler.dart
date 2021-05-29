import 'package:expense_manager/model/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'products.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, price INTEGER NOT NULL, date TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertUser(users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

}
