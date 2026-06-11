import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/model.dart';

class CsvExporter {
  static String _escape(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }

  static Future<void> export(List<Model> modelList) async {
    final buffer = StringBuffer();

    // 有料版と同じ61列ヘッダー
    buffer.writeln(
      '受診日,検査種別,身長,体重,腹囲,'
      '右視力(裸眼),左視力(裸眼),右視力(矯正),左視力(矯正),'
      '右聴力1000,左聴力1000,右聴力4000,左聴力4000,'
      '血圧(上),血圧(下),レントゲン,心電図,内科診察,'
      '総蛋白,アルブミン,総ビリルビン,GOT,GPT,ALP,γ-GTP,'
      '総コレステロール,LDL,HDL,中性脂肪,尿酸,'
      '尿素窒素,クレアチニン,アミラーゼ,'
      '空腹時血糖,HbA1c,'
      '白血球,赤血球,血色素,ヘマトクリット,MCV,MCH,MCHC,血清鉄,血小板,'
      '尿糖,尿蛋白,尿潜血,便潜血,メモ,'
      '眼圧(右),眼圧(左),コンタクト度数(右),コンタクト度数(左),'
      '乱視度数(右),乱視度数(左),軸度(右),軸度(左),'
      'CEA,AFP,PSA,CA19-9,CA125',
    );

    for (final model in modelList) {
      final values = [
        model.on_the_day_24,
        model.priority.toString(),
        model.height_1,
        model.weight_2,
        model.waist_3,
        model.right_eye_4,
        model.left_eye_5,
        model.correctedEyesightRight_27,
        model.correctedEyesightLeft_28,
        model.hearing_right_1000_6,
        model.hearing_left_1000_7,
        model.hearing_right_4000_8,
        model.hearing_left_4000_9,
        model.high_blood_pressure_12,
        model.low_blood_pressure_11,
        model.x_ray_10,
        model.ecg_23,
        model.internal_47,
        model.totalProtein_31,
        model.albumin_32,
        model.totalBilirubin_33,
        model.got_15,
        model.gpt_16,
        model.alp_34,
        model.gtp_17,
        model.totalCholesterol_35,
        model.ldl_18,
        model.hdl_19,
        model.neutral_fat_20,
        model.uricAcid_36,
        model.ureaNitrogen_37,
        model.creatinine_38,
        model.amylase_39,
        model.blood_glucose_21,
        model.hA1c_22,
        model.whiteBloodCell_40,
        model.red_blood_13,
        model.hemoglobin_14,
        model.hematocrit_41,
        model.mcv_42,
        model.mch_43,
        model.mchc_44,
        model.serumIron_45,
        model.platelet_46,
        model.sugar_26,
        model.urine_25,
        model.lateBlood_29,
        model.bloodInTheStool_30,
        '', // メモ（無料版なし）
        '', // 眼圧(右)（無料版なし）
        '', // 眼圧(左)（無料版なし）
        '', // コンタクト度数(右)（無料版なし）
        '', // コンタクト度数(左)（無料版なし）
        '', // 乱視度数(右)（無料版なし）
        '', // 乱視度数(左)（無料版なし）
        '', // 軸度(右)（無料版なし）
        '', // 軸度(左)（無料版なし）
        '', // CEA（無料版なし）
        '', // AFP（無料版なし）
        '', // PSA（無料版なし）
        '', // CA19-9（無料版なし）
        '', // CA125（無料版なし）
      ];
      buffer.writeln(values.map(_escape).join(','));
    }

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/healthcare_export.csv';
    final file = File(path);
    await file.writeAsString(buffer.toString());

    await Share.shareXFiles(
      [XFile(path)],
      text: 'Healthcare Mania Lite データエクスポート',
    );
  }
}
