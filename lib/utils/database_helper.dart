import 'dart:async';
import 'dart:io';
import 'package:healthcare_mania_legacy_new/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String modelTable = 'model_table';
  String colId = 'id';
  String colHeight = 'height';
  String colWeight = 'weight';
  String colEyeR = 'right_eye';
  String colEyeL = 'left_eye';
  String colHearingRight1000 = 'hearing_right_1000';
  String colHearingLeft1000 = 'hearing_left_1000';
  String colHearingRight4000 = 'hearing_right_4000';
  String colHearingLeft4000 = 'hearing_left_4000';
  String colXRay = 'x_ray';
  String colBpLow = 'low_blood_pressure';
  String colBpHeight = 'high_blood_pressure';
  String colRedBlood = 'red_blood';
  String colHemoglobin = 'hemoglobin';
  String colGot = 'got';
  String colGpt = 'gpt';
  String colGtp = 'gtp';
  String colLdl = 'ldl';
  String colHdl = 'hdl';
  String colNeutralFat = 'neutral_fat';
  String colBloodGlucose = 'blood_glucose';
  String colHA1c = 'hA1c';
  String colSugar = 'sugar';
  String colUrine = 'urine';
  String colEcg = 'ecg';
  String colOnTheDay = 'on_the_day';
  String colPriority = 'priority';
  String colDate = 'date';

  //Ver2追加
  String colWaist = 'waist';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}models.db';

    // Open/create the database at a given path
    var modelsDatabase = await openDatabase(path,
        version: 2, onCreate: _createDb);// ,onUpgrade: _upgradeDB);
    return modelsDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('CREATE TABLE $modelTable('
        ' $colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        ' $colHeight TEXT, $colWeight TEXT,'
        ' $colEyeR TEXT, $colEyeL TEXT,'
        ' $colHearingRight1000 TEXT, $colHearingLeft1000 TEXT,'
        ' $colHearingRight4000 TEXT, $colHearingLeft4000 TEXT,'
        ' $colXRay TEXT, '
        ' $colBpLow TEXT, $colBpHeight TEXT,'
        ' $colRedBlood TEXT, $colHemoglobin TEXT,'
        ' $colGot TEXT, $colGpt TEXT, $colGtp TEXT, $colLdl TEXT, $colHdl TEXT, $colNeutralFat TEXT, '
        ' $colBloodGlucose TEXT, $colHA1c TEXT, $colUrine TEXT, $colSugar TEXT, $colEcg TEXT, '
        ' $colOnTheDay TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  /*void _upgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colWaist TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBpHeight ');
  }*/

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
  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $modelTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Model>> getModelList() async {
    var modelMapList = await getModelMapList(); // Get 'Map List' from database
    int count =
        modelMapList.length; // Count the number of map entries in db table
    // ignore: deprecated_member_use
    List<Model> modelList = <Model>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      modelList.add(Model.fromMapObject(modelMapList[i]));
    }

    return modelList;
  }
}
