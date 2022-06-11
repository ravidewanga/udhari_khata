import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/borrow.dart';

class UdhariKhata{
  static final UdhariKhata instance = UdhariKhata._init();
  static Database? _database;
  UdhariKhata._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('udharikhata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
     CREATE TABLE $tableFiles (
      ${BorrowFields.id} $idType, 
      ${BorrowFields.personName} $textType,
      ${BorrowFields.amount} $textType,
      ${BorrowFields.interest} $textType,
      ${BorrowFields.returnDate} $textType,
      ${BorrowFields.createdAt} $textType,
      ${BorrowFields.updatedAt} $textType,
      ${BorrowFields.status} $integerType
      )
    ''');
  }

  Future<BorrowList> addNew(BorrowList list) async {
    final db = await instance.database;
    final id = await db.insert(tableFiles, list.toJson());
    return list.copy(id: id);
  }

  Future<List<BorrowList>> getRecords(int id) async {
    final db = await instance.database;
    final result = await db.query(
      tableFiles,
      orderBy: '${BorrowFields.id} DESC',
      where: '${BorrowFields.id} = ?',
      whereArgs: [id],
    );
    return result.map((json) => BorrowList.fromJson(json)).toList();
  }

  Future<List<BorrowList>> getAllRecords() async {
    final db = await instance.database;
    const orderBy = '${BorrowFields.id} DESC';
    final result = await db.query(tableFiles, orderBy: orderBy);
    return result.map((json) => BorrowList.fromJson(json)).toList();
  }

  Future<int> deleteRecords(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableFiles,
      where: '${BorrowFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateRecords(int id, String uploadStatus,uploadTime) async {
    final db = await instance.database;
    return await db.rawUpdate(
        'UPDATE $tableFiles SET ${BorrowFields.updatedAt} = ?, '
            '${BorrowFields.amount} = ? '
            'WHERE ${BorrowFields.id} = ?',
        [uploadTime, uploadStatus, id]
    );
  }
}