import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/model.dart';

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
  String colCorrectedEyeR = 'correctedEyesight_right'; //矯正視力右
  String colCorrectedEyeL = 'correctedEyesight_left'; //矯正視力左
  String colLatenBlood = 'latenBlood'; //潜血
  String colBloodInTheStool = 'bloodInTheStool'; //便潜血
  String colTotalProtein = 'totalProtein'; //総蛋白
  String colAlbumin = 'albumin'; //アルブミ
  String colTotalBilirubin = 'totalBilirubin'; //総ビリルビン
  String colAlp = 'alp'; //ALP
  String colTotalCholesterol = 'totalCholesterol'; //総コレステロール
  String colUricAcid = 'uricAcid'; //尿酸
  String colReaNitrogen = 'ureaNitrogen'; //尿素窒素
  String colCreatinine = 'creatinine'; //クレアチニン
  String colAmylase = 'amylase'; //アミラーゼ
  String colWhiteBloodCell ='whiteBloodCell'; //白血球数
  String colHematocrit = 'hematocrit';
  String colMcv = 'mcv';
  String colMch = 'mch';
  String colMchc = 'mchc';
  String colSerumIron = 'serumIron';
  String colPlatelet = 'platelet';

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
    var modelsDatabase = await openDatabase(
        path,
        version: 2,
        onCreate: _createDb,
        onUpgrade: _upgradeDB);
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

  void _upgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colWaist TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colCorrectedEyeR TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colCorrectedEyeL TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colLatenBlood TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colBloodInTheStool TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colTotalProtein TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colAlbumin TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colTotalBilirubin TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colAlp TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colTotalCholesterol TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colUricAcid TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colReaNitrogen TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colCreatinine TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colAmylase TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colWhiteBloodCell TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colHematocrit TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colMcv TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colMch TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colMchc TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colSerumIron TEXT');
    await db.execute('ALTER TABLE $modelTable ADD COLUMN $colPlatelet TEXT');
  }

  Future<List<Map<String, dynamic>>> getModelMapList() async {
    Database db = await database;
    var result = await db.query(modelTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertModel(Model models) async {
    Database db = await database;
    var result = await db.insert(modelTable, models.toMap());
    return result;
  }

  Future<int> updateModel(Model model) async {
    var db = await database;
    var result = await db.update(modelTable, model.toMap(),
        where: '$colId = ?', whereArgs: [model.id]);
    return result;
  }

  Future<int> deleteModel(int id) async {
    var db = await database;
    int result =
        await db.rawDelete('DELETE FROM $modelTable WHERE $colId = $id');
    return result;
  }

  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $modelTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Model>> getModelList() async {
    var modelMapList = await getModelMapList(); // Get 'Map List' from database
    int count =
        modelMapList.length; // Count the number of map entries in db table
    List<Model> modelList = <Model>[];
    for (int i = 0; i < count; i++) {
      modelList.add(Model.fromMapObject(modelMapList[i]));
    }
    return modelList;
  }
}
