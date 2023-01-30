import 'dart:async';
import 'dart:io';
import 'package:healthcare_mania_legacy_new/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String modelTable = 'model_table';
  String colId = 'id';
  String colHeight = 'height';
  String colWeight = 'weight';
  //String colWaist = 'waist';
  // ignore: non_constant_identifier_names
  String colR_Eye = 'right_eye';
  // ignore: non_constant_identifier_names
  String colL_Eye = 'left_eye';
  // ignore: non_constant_identifier_names
  String colHearing_right_1000 = 'hearing_right_1000';
  // ignore: non_constant_identifier_names
  String colHearing_left_1000 = 'hearing_left_1000';
  // ignore: non_constant_identifier_names
  String colHearing_right_4000 = 'hearing_right_4000';
  // ignore: non_constant_identifier_names
  String colHearing_left_4000 = 'hearing_left_4000';
  // ignore: non_constant_identifier_names
  String colX_ray = 'x_ray';
  // ignore: non_constant_identifier_names
  String colL_Bp = 'low_blood_pressure';
  // ignore: non_constant_identifier_names
  String colH_Bp = 'high_blood_pressure';
  // ignore: non_constant_identifier_names
  String colRed_blood = 'red_blood';
  String colHemoglobin = 'hemoglobin';
  String colGot = 'got';
  String colGpt = 'gpt';
  String colGtp = 'gtp';
  String colLdl = 'ldl';
  String colHdl = 'hdl';
  // ignore: non_constant_identifier_names
  String colNeutral_fat = 'neutral_fat';
  // ignore: non_constant_identifier_names
  String colBlood_glucose = 'blood_glucose';
  String colHA1c = 'hA1c';
  String colSugar = 'sugar';
  String colUrine = 'urine';
  String colEcg = 'ecg';
  // ignore: non_constant_identifier_names
  String colOn_the_day = 'on_the_day';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}models.db';

    // Open/create the database at a given path
    var modelsDatabase =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return modelsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $modelTable('
        ' $colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        ' $colHeight TEXT, $colWeight TEXT,'
        ' $colR_Eye TEXT, $colL_Eye TEXT,'
        ' $colHearing_right_1000 TEXT, $colHearing_left_1000 TEXT,'
        ' $colHearing_right_4000 TEXT, $colHearing_left_4000 TEXT,'
        ' $colX_ray TEXT, '
        ' $colL_Bp TEXT, $colH_Bp TEXT,'
        ' $colRed_blood TEXT, $colHemoglobin TEXT,'
        ' $colGot TEXT, $colGpt TEXT, $colGtp TEXT, $colLdl TEXT, $colHdl TEXT, $colNeutral_fat TEXT, '
        ' $colBlood_glucose TEXT, $colHA1c TEXT, $colUrine TEXT, $colSugar TEXT, $colEcg TEXT, '
        ' $colOn_the_day TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getModelMapList() async {
    Database db = await database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(modelTable, orderBy: '$colPriority ASC');
    return result;

  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertModel(Model models) async {
    Database db = await database;
    var result = await db.insert(modelTable, models.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateModel(Model model) async {
    var db = await database;
    var result = await db.update(modelTable, model.toMap(),
        where: '$colId = ?', whereArgs: [model.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteModel(int id) async {
    var db = await database;
    int result =
    await db.rawDelete('DELETE FROM $modelTable WHERE $colId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $modelTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Model>> getModelList() async {
    var modelMapList = await getModelMapList(); // Get 'Map List' from database
    int count = modelMapList.length; // Count the number of map entries in db table
    // ignore: deprecated_member_use
    List<Model> modelList = <Model>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      modelList.add(Model.fromMapObject(modelMapList[i]));
    }

    return modelList;
  }
}
