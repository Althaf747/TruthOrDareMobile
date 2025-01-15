import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
    static Database? _db;
    static final DatabaseService instance = DatabaseService._constructor();

    final String _cardsTableName = "cards";
    final String _cardsIdColumnName = "id";
    final String _cardsTypeColumnName = "type";
    final String _cardsQuestionColumnName = "question";
    final String _cardsCreatedColumnName = "created";

    DatabaseService._constructor();

    Future<Database> get database async {
      if(_db != null) return _db!;
      _db = await getDatabase();
      return _db!;
    }

    Future<Database> getDatabase() async {
      final databaseDirPath = await getDatabasesPath();
      final databasePath = join(databaseDirPath, "card_db.db");
      final database = await openDatabase(
          databasePath,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE $_cardsTableName (
            $_cardsIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_cardsTypeColumnName STRING NOT NULL,
            $_cardsQuestionColumnName TEXT NOT NULL,
            $_cardsCreatedColumnName INTEGER NOT NULL
          )
          ''');
        },
      );
      return database;
    }

    void addCard(String type, String question) async {
      final db = await database;
      await db.insert(_cardsTableName, {
        _cardsTypeColumnName : type,
        _cardsQuestionColumnName : question,
        _cardsCreatedColumnName : 1
      });
    }
}