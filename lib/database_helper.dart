import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'TeamModel.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton
  static Database _database;

  String tblname = "teams";
  String colid = "id";
  String colteamname = "teamname";
  String colteamcode = "teamcode";
  String colpwrcard1 = "powercard1";
  String colpwrcard2 = "powercard2";
  String colroundnum = "roundnumber";
  String colmoney = "money";

  String tbl2name = "rounds";
  String col2id = "id";

  String stock1count = "stock1";
  String stock2count = "stock2";
  String stock3count = "stock3";
  String stock4count = "stock4";
  String stock5count = "stock5";

  DatabaseHelper._createInstance(); // Named constructor to create instance

  factory DatabaseHelper() {
    if (_databaseHelper == null)
      _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initializeDb();
    return _database;
  }

  Future<Database> initializeDb() async {
    print("init database");
//    get directory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'mydb.db';

    var mydb = await openDatabase(path, version: 1, onCreate: _createDb);
    return mydb;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblname($colid INTEGER PRIMARY KEY AUTOINCREMENT, $colteamname TEXT, $colteamcode TEXT, $colpwrcard1 INTEGER, $colpwrcard2 INTEGER, $colroundnum INTEGER, $colmoney INTEGER)');

    print("create1");
    await db.execute(
        'CREATE TABLE $tbl2name($col2id INTEGER, $stock1count INTEGER, $stock2count INTEGER, $stock3count INTEGER, $stock4count INTEGER, $stock5count INTEGER)');
    print("create2");
  }

  Future<Map<String, dynamic>> getTeamMap() async {
    Database db = await this.database;
//    var result = await db.rawQuery('SELECT * FROM $tblname');
    var result = await db.query(tblname);
    return result[0];
  }

  Future<Map<String, dynamic>> getRoundMap(int num) async {
    Database db = await this.database;
//    var result = await db.rawQuery('SELECT * FROM $tblname');
    var result =
    await db.rawQuery("SELECT * FROM $tbl2name WHERE $col2id = $num");

    return result[0];
  }

//  TO get sum of all rounds
  Future<Map<String, dynamic>> getRoundMapTotal() async {
    Database db = await this.database;
//    var result = await db.rawQuery('SELECT * FROM $tblname');
    var result = await db.rawQuery(
        "SELECT sum($stock1count),sum($stock2count),sum($stock3count),sum($stock4count),sum($stock5count)  FROM $tbl2name");
    int count = await getTbl2Count();
    if (count > 0)
      return result[0];
    return null;
  }

  Future<int> insertTeam(Team team) async {
    Database db = await this.database;

    var result = await db.insert(tblname, team.toMap());
    return result;
  }

  Future<int> insertRound(int roundno, List<int> arr) async {
    Database db = await this.database;
    String query =
        "INSERT INTO $tbl2name VALUES($roundno,${arr[0]},${arr[1]},${arr[2]},${arr[3]},${arr[4]})";

    var result = await db.rawInsert(query);
    return result;
  }

  Future<int> updateMoney(int num) async {
    Database db = await this.database;

    var result = await db.rawUpdate("UPDATE $tblname SET $colmoney = $num");
    print(getTeamMap());
    return result;
  }

  Future<int> updatePowerCard1(int num) async {
    Database db = await this.database;

    var result = await db.rawUpdate("UPDATE $tblname SET $colpwrcard1= $num");
    print(getTeamMap());
    return result;
  }

  Future<int> updatePowerCard2(int num) async {
    Database db = await this.database;

    var result = await db.rawUpdate("UPDATE $tblname SET $colpwrcard2= $num");
    print(getTeamMap());
    return result;
  }

  Future<int> updateRoundNum(int num) async {
    Database db = await this.database;

    var result = await db.rawUpdate("UPDATE $tblname SET $colroundnum= $num");
    print(getTeamMap());
    return result;
  }

  Future<int> updateTeam(Team team) async {
    Database db = await this.database;

    var result = await db.update(tblname, team.toMap(),
        where: '$colid = ?', whereArgs: [team.id]);
    return result;
  }

  Future<int> deleteTeam(int id) async {
    Database db = await this.database;

    var result = await db.rawDelete('DELETE FROM $tblname WHERE $colid = $id');
    return result;
  }

  Future<int> deleteAllTeams() async {
    Database db = await this.database;

    var result = await db.rawDelete('DELETE FROM $tblname');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT(*) from  $tblname');
    int result = Sqflite.firstIntValue(x);
    print("In count " + result.toString());
    return result;
  }


  Future<int> getTbl2Count() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT(*) from  $tbl2name');
    int result = Sqflite.firstIntValue(x);
    print("In count " + result.toString());
    return result;
  }

  Future<bool> isLoggedIn() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT(*) from  $tblname');
    int result = Sqflite.firstIntValue(x);
    print("In count " + result.toString());
    return result > 0 ? true : false;
  }

//  Call to clear data of all rounds
  Future<int> clearTrialRound() async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $tbl2name');
    return result;
  }
}
