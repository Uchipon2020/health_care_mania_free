class Model {
  int? _id;
  String? _date; //更新日
  int? _priority; //定期・ドッグフラグ
  String? _1_height; //身長 *
  String? _2_weight; //体重 *
  String? _3_waist; //腹囲 *
  String? _4_right_eye; //右視力 *
  String? _5_left_eye; //左視力 *
  String? _6_hearing_right_1000; //聴力右1000Hz *
  String? _7_hearing_left_1000; // *
  String? _8_hearing_right_4000; //*
  String? _9_hearing_left_4000; //*
  String? _10_x_ray; //レントゲン
  String? _11_low_blood_pressure; //下血圧 *
  String? _12_high_blood_pressure; //上血圧 *
  String? _13_red_blood; //貧血検査・赤血球数 *
  String? _14_hemoglobin; //貧血検査・血色素量 *
  String? _15_got; //肝機能検査 *
  String? _16_gpt; //肝機能検査 *
  String? _17_gtp; //ガンマ  *
  String? _18_ldl; //血中資質検査 *
  String? _19_hdl; //*
  String? _20_neutral_fat; //中性脂肪 *
  String? _21_blood_glucose; //血統空腹時
  String? _22_hA1c; //血統A1c
  String? _23_ecg; //心電図
  String? _24_on_the_day; //受診日
  String? _25_urine; //尿蛋白
  String? _26_sugar; //尿糖
  //////////version2
  String? _27_correctedEyesight_right; //矯正視力右
  String? _28_correctedEyesight_left; //矯正視力左
  String? _29_latentBlood; //潜血
  String? _30_bloodInTheStool; //便潜血
  String? _31_totalProtein; //総蛋白
  String? _32_albumin; //アルブミン
  String? _33_totalBilirubin; //総ビリルビン
  String? _34_alp; //ALP
  String? _35_totalCholesterol; //総コレステロール
  String? _36_uricAcid; //尿酸
  String? _37_ureaNitrogen; //尿素窒素
  String? _38_creatinine; //クレアチニン
  String? _39_amylase; //アミラーゼ
  String? _40_whiteBloodCell; //白血球数
  String? _41_hematocrit;
  String? _42_mcv;
  String? _43_mch;
  String? _44_mchc;
  String? _45_serumIron;
  String? _46_platelet;

  Model(
      this._priority, [
    this._1_height = "",
    this._2_weight = "",
    this._3_waist = "",
    this._4_right_eye = "",
    this._5_left_eye = "",
    this._6_hearing_right_1000 = "",
    this._7_hearing_left_1000 = "",
    this._8_hearing_right_4000 = "",
    this._9_hearing_left_4000 = "",
    this._10_x_ray = "",
    this._11_low_blood_pressure = "",
    this._12_high_blood_pressure = "",
    this._13_red_blood = "",
    this._14_hemoglobin = "",
    this._15_got = "",
    this._16_gpt = "",
    this._17_gtp = "",
    this._18_ldl = "",
    this._19_hdl = "",
    this._20_neutral_fat = "",
    this._21_blood_glucose = "",
    this._22_hA1c = "",
    this._23_ecg = "",
    this._24_on_the_day = "",
    this._25_urine = "",
    this._26_sugar = "",
    //////////version2
    this._27_correctedEyesight_right = "", //矯正視力右
    this._28_correctedEyesight_left = "", //矯正視力左
    this._29_latentBlood = "", //潜血
    this._30_bloodInTheStool = "", //便潜血
    this._31_totalProtein = "", //総蛋白
    this._32_albumin = "", //アルブミン
    this._33_totalBilirubin = "", //総ビリルビン
    this._34_alp = "", //ALP
    this._35_totalCholesterol = "", //総コレステロール
    this._36_uricAcid = "", //尿酸
    this._37_ureaNitrogen = "", //尿素窒素
    this._38_creatinine = "", //クレアチニン
    this._39_amylase = "", //アミラーゼ
    this._40_whiteBloodCell = "", //白血球数
    this._41_hematocrit = "", //ヘマトクリット
    this._42_mcv = "",
    this._43_mch = "",
    this._44_mchc = "",
    this._45_serumIron = "", //血清鉄
    this._46_platelet = "", //血小板
  ]);

  Model.withId(
      this._id,
      this._date,
      this._priority, [
        this._1_height = "",
        this._2_weight = "",
        this._3_waist = "",
        this._4_right_eye = "",
        this._5_left_eye = "",
        this._6_hearing_right_1000 = "",
        this._7_hearing_left_1000 = "",
        this._8_hearing_right_4000 = "",
        this._9_hearing_left_4000 = "",
        this._10_x_ray = "",
        this._11_low_blood_pressure = "",
        this._12_high_blood_pressure = "",
        this._13_red_blood = "",
        this._14_hemoglobin = "",
        this._15_got = "",
        this._16_gpt = "",
        this._17_gtp = "",
        this._18_ldl = "",
        this._19_hdl = "",
        this._20_neutral_fat = "",
        this._21_blood_glucose = "",
        this._22_hA1c = "",
        this._23_ecg = "",
        this._24_on_the_day = "",
        this._25_urine = "",
        this._26_sugar = "",
        //////////version2
        this._27_correctedEyesight_right = "", //矯正視力右
        this._28_correctedEyesight_left = "", //矯正視力左
        this._29_latentBlood = "", //潜血
        this._30_bloodInTheStool = "", //便潜血
        this._31_totalProtein = "", //総蛋白
        this._32_albumin = "", //アルブミン
        this._33_totalBilirubin = "", //総ビリルビン
        this._34_alp = "", //ALP
        this._35_totalCholesterol = "", //総コレステロール
        this._36_uricAcid = "", //尿酸
        this._37_ureaNitrogen = "", //尿素窒素
        this._38_creatinine = "", //クレアチニン
        this._39_amylase = "", //アミラーゼ
        this._40_whiteBloodCell = "", //白血球数
        this._41_hematocrit = "", //ヘマトクリット
        this._42_mcv = "",
        this._43_mch = "",
        this._44_mchc = "",
        this._45_serumIron = "", //血清鉄
        this._46_platelet = "", //血小板
      ]);

  int? get id => _id;
  String get height_1 => _1_height!;
  String get weight_2 => _2_weight!;
  String get waist_3 => _3_waist!;
  String get right_eye_4 => _4_right_eye!;
  String get left_eye_5 => _5_left_eye!;
  String get hearing_right_1000_6 => _6_hearing_right_1000!;
  String get hearing_left_1000_7 => _7_hearing_left_1000!;
  String get hearing_right_4000_8 => _8_hearing_right_4000!;
  String get hearing_left_4000_9 => _9_hearing_left_4000!;
  String get x_ray_10 => _10_x_ray!;
  String get low_blood_pressure_11 => _11_low_blood_pressure!;
  String get high_blood_pressure_12 => _12_high_blood_pressure!;
  String get red_blood_13 => _13_red_blood!;
  String get hemoglobin_14 => _14_hemoglobin!;
  String get got_15 => _15_got!;
  String get gpt_16 => _16_gpt!;
  String get gtp_17 => _17_gtp!;
  String get ldl_18 => _18_ldl!;
  String get hdl_19 => _19_hdl!;
  String get neutral_fat_20 => _20_neutral_fat!;
  String get blood_glucose_21 => _21_blood_glucose!;
  String get hA1c_22 => _22_hA1c!;
  String get ecg_23 => _23_ecg!;
  String get on_the_day_24 => _24_on_the_day!;
  String get urine_25 => _25_urine!;
  String get sugar_26 => _26_sugar!;
  int get priority => _priority!;
  String get date => _date!;
  String get correctedEyesightRight_27 => _27_correctedEyesight_right!; //矯正視力右
  String get correctedEyesightLeft_28 => _28_correctedEyesight_left!; //矯正視力左
  String get lateBlood_29 => _29_latentBlood!; //潜血
  String get bloodInTheStool_30 => _30_bloodInTheStool!; //便潜血
  String get totalProtein_31 => _31_totalProtein!; //総蛋白
  String get albumin_32 => _32_albumin!; //アルブミン
  String get totalBilirubin_33 => _33_totalBilirubin!; //総ビリルビン
  String get alp_34 => _34_alp!; //ALP
  String get totalCholesterol_35 => _35_totalCholesterol!; //総コレステロール
  String get uricAcid_36 => _36_uricAcid!; //尿酸
  String get ureaNitrogen_37 => _37_ureaNitrogen!; //尿素窒素
  String get creatinine_38 => _38_creatinine!; //クレアチニン
  String get amylase_39 => _39_amylase!; //アミラーゼ
  String get whiteBloodCell_40 => _40_whiteBloodCell!; //白血球数
  String get hematocrit_41 => _41_hematocrit!; //ヘマトクリット
  String get mcv_42 => _42_mcv!;
  String get mch_43 => _43_mch!;
  String get mchc_44 => _44_mchc!;
  String get serumIron_45 => _45_serumIron!; //血清鉄
  String get platelet_46 => _46_platelet!; //血小板

  /////setter aria
  set height_1(String newHeight) {
    if (newHeight.length <= 255) {
      _1_height = newHeight;
    }
  }
  set weight_2(String newWeight) {
    if (newWeight.length <= 255) {
      _2_weight = newWeight;
    }
  }
  set waist_3(String newWaist) {
    if (newWaist.length <= 255) {
      _3_waist = newWaist;
    }
  }
  set right_eye_4(String newREye) {
    if (newREye.length <= 255) {
      _4_right_eye = newREye;
    }
  }
  set left_eye_5(String newLEye) {
    if (newLEye.length <= 255) {
      this._5_left_eye = newLEye;
    }
  }
  set hearing_right_1000_6(String newHearingRight1000) {
    if (newHearingRight1000.length <= 255) {
      _6_hearing_right_1000 = newHearingRight1000;
    }
  }
  set hearing_left_1000_7(String newHearingLeft1000) {
    if (newHearingLeft1000.length <= 255) {
      _7_hearing_left_1000 = newHearingLeft1000;
    }
  }
  set hearing_right_4000_8(String newHearingRight4000) {
    if (newHearingRight4000.length <= 255) {
      _8_hearing_right_4000 = newHearingRight4000;
    }
  }
  set hearing_left_4000_9(String newHearingLeft4000) {
    if (newHearingLeft4000.length <= 255) {
      _9_hearing_left_4000 = newHearingLeft4000;
    }
  }
  set x_ray_10(String newXRay) {
    if (newXRay.length <= 255) {
      _10_x_ray = newXRay;
    }
  }
  set low_blood_pressure_11(String newLBP) {
    if (newLBP.length <= 255) {
      this._11_low_blood_pressure = newLBP;
    }
  }
  set high_blood_pressure_12(String newHBP) {
    if (newHBP.length <= 255) {
      _12_high_blood_pressure = newHBP;
    }
  }
  set red_blood_13(String newRedBlood) {
    if (newRedBlood.length <= 255) {
      _13_red_blood = newRedBlood;
    }
  }
  set hemoglobin_14(String newHemoglobin) {
    if (newHemoglobin.length <= 255) {
      _14_hemoglobin = newHemoglobin;
    }
  }
  set got_15(String newGot) {
    if (newGot.length <= 255) {
      _15_got = newGot;
    }
  }
  set gpt_16(String newGpt) {
    if (newGpt.length <= 255) {
      _16_gpt = newGpt;
    }
  }
  set gtp_17(String newGtp) {
    if (newGtp.length <= 255) {
      _17_gtp = newGtp;
    }
  }
  set ldl_18(String newLdl) {
    if (newLdl.length <= 255) {
      _18_ldl = newLdl;
    }
  }
  set hdl_19(String newHdl) {
    if (newHdl.length <= 255) {
      _19_hdl = newHdl;
    }
  }
  set neutral_fat_20(String newNeutralFat) {
    if (newNeutralFat.length <= 255) {
      _20_neutral_fat = newNeutralFat;
    }
  }
  set blood_glucose_21(String newBloodGlucose) {
    if (newBloodGlucose.length <= 255) {
      _21_blood_glucose = newBloodGlucose;
    }
  }
  set hA1c_22(String newHA1c) {
    if (newHA1c.length <= 255) {
      _22_hA1c = newHA1c;
    }
  }
  set ecg_23(String newEcg) {
    if (newEcg.length <= 255) {
      _23_ecg = newEcg;
    }
  }
  set on_the_day_24(String newOTD) {
    if (newOTD.length <= 255) {
      _24_on_the_day = newOTD;
    }
  }
  set urine_25(String newUrine) {
    if (newUrine.length <= 255) {
      _25_urine = newUrine;
    }
  }
  set sugar_26(String newSugar) {
    if (newSugar.length <= 255) {
      _26_sugar = newSugar;
    }
  }
  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      _priority = newPriority;
    }
  }
  set date(String newDate) {
    _date = newDate;
  }
  set correctedEyesight_left_28 (String value) {
    _28_correctedEyesight_left = value;
  }
  set latentBlood_29(String value) {
    _29_latentBlood = value;
  }
  set bloodInTheStool_30(String value) {
    _30_bloodInTheStool = value;
  }
  set totalProtein_31(String value) {
    _31_totalProtein = value;
  }
  set albumin_32(String value) {
    _32_albumin = value;
  }
  set totalBilirubin_33(String value) {
    _33_totalBilirubin = value;
  }
  set alp_34(String value) {
    _34_alp = value;
  }
  set totalCholesterol_35(String value) {
    _35_totalCholesterol = value;
  }
  set uricAcid_36(String value) {
    _36_uricAcid = value;
  }
  set ureaNitrogen_37(String value) {
    _37_ureaNitrogen = value;
  }
  set creatinine_38(String value) {
    _38_creatinine = value;
  }
  set amylase_39(String value) {
    _39_amylase = value;
  }
  set whiteBloodCell_40(String value) {
    _40_whiteBloodCell = value;
  }
  set hematocrit_41(String value) {
    _41_hematocrit = value;
  }
  set mcv_42(String value) {
    _42_mcv = value;
  }
  set mch_43(String value) {
    _43_mch = value;
  }
  set mchc_44(String value) {
    _44_mchc = value;
  }
  set serumIron_45(String value) {
    _45_serumIron = value;
  }
  set platelet_46(String value) {
    _46_platelet = value;
  }
  set correctedEyesight_right_27(String value) {
    _27_correctedEyesight_right = value;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['height'] = _1_height;
    map['weight'] = _2_weight;
    map['waist'] = _3_waist;
    map['right_eye'] = _4_right_eye;
    map['left_eye'] = _5_left_eye;
    map['hearing_right_1000'] = _6_hearing_right_1000;
    map['hearing_left_1000'] = _7_hearing_left_1000;
    map['hearing_right_4000'] = _8_hearing_right_4000;
    map['hearing_left_4000'] = _9_hearing_left_4000;
    map['x_ray'] = _10_x_ray;
    map['low_blood_pressure'] = _11_low_blood_pressure;
    map['high_blood_pressure'] = _12_high_blood_pressure;
    map['red_blood'] = _13_red_blood;
    map['hemoglobin'] = _14_hemoglobin;
    map['got'] = _15_got;
    map['gpt'] = _16_gpt;
    map['gtp'] = _17_gtp;
    map['ldl'] = _18_ldl;
    map['hdl'] = _19_hdl;
    map['neutral_fat'] = _20_neutral_fat;
    map['blood_glucose'] = _21_blood_glucose;
    map['hA1c'] = _22_hA1c;
    map['ecg'] = _23_ecg;
    map['on_the_day'] = _24_on_the_day;
    map['urine'] = _25_urine;
    map['sugar'] = _26_sugar;
    map['priority'] = _priority;
    map['date'] = _date;
    map['correctedEyesight_right'] =  _27_correctedEyesight_right; //矯正視力右
    map['correctedEyesight_left'] = _28_correctedEyesight_left; //矯正視力左
    map['latenBlood'] = _29_latentBlood; //潜血
    map['bloodInTheStool'] = _30_bloodInTheStool; //便潜血
    map['totalProtein'] = _31_totalProtein; //総蛋白
    map['albumin'] = _32_albumin; //アルブミン
    map['totalBilirubin'] = _33_totalBilirubin; //総ビリルビン
    map['alp'] = _34_alp; //ALP
    map['totalCholesterol'] = _35_totalCholesterol; //総コレステロール
    map['uricAcid'] = _36_uricAcid; //尿酸
    map['ureaNitrogen'] = _37_ureaNitrogen; //尿素窒素
    map['creatinine'] = _38_creatinine; //クレアチニン
    map['amylase'] = _39_amylase; //アミラーゼ
    map['whiteBloodCell'] = _40_whiteBloodCell; //白血球数
    map['hematocrit'] = _41_hematocrit;
    map['mcv'] = _42_mcv;
    map['mch'] = _43_mch;
    map['mchc'] = _44_mchc;
    map['serumIron'] = _45_serumIron;
    map['platelet'] = _46_platelet;
    return map;
  }

  Model.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _1_height = map['height'];
    _2_weight = map['weight'];
    _3_waist = map['waist'];
    _4_right_eye = map['right_eye'];
    _5_left_eye = map['left_eye'];
    _6_hearing_right_1000 = map['hearing_right_1000'];
    _7_hearing_left_1000 = map['hearing_left_1000'];
    _8_hearing_right_4000 = map['hearing_right_4000'];
    _9_hearing_left_4000 = map['hearing_left_4000'];
    _10_x_ray = map['x_ray'];
    _11_low_blood_pressure = map['low_blood_pressure'];
    _12_high_blood_pressure = map['high_blood_pressure'];
    _13_red_blood = map['red_blood'];
    _14_hemoglobin = map['hemoglobin'];
    _15_got = map['got'];
    _16_gpt = map['gpt'];
    _17_gtp = map['gtp'];
    _18_ldl = map['ldl'];
    _19_hdl = map['hdl'];
    _20_neutral_fat = map['neutral_fat'];
    _21_blood_glucose = map['blood_glucose'];
    _22_hA1c = map['hA1c'];
    _23_ecg = map['ecg'];
    _24_on_the_day = map['on_the_day'];
    _25_urine = map['urine'];
    _26_sugar = map['sugar'];
    _priority = map['priority'];
    _date = map['date'];
    ///////////
    _27_correctedEyesight_right = map['correctedEyesight_right']; //矯正視力右
    _28_correctedEyesight_left= map['correctedEyesight_left']; //矯正視力左
    _29_latentBlood = map['latenBlood']; //潜血
    _30_bloodInTheStool = map['bloodInTheStool']; //便潜血
    _31_totalProtein = map['totalProtein']; //総蛋白
    _32_albumin = map['albumin']; //アルブミン
    _33_totalBilirubin = map['totalBilirubin']; //総ビリルビン
    _34_alp =  map['alp']; //ALP
    _35_totalCholesterol = map['totalCholesterol']; //総コレステロール
    _36_uricAcid = map['uricAcid']; //尿酸
    _37_ureaNitrogen = map['ureaNitrogen']; //尿素窒素
    _38_creatinine = map['creatinine']; //クレアチニン
    _39_amylase = map['amylase']; //アミラーゼ
    _40_whiteBloodCell = map['whiteBloodCell']; //白血球数
    _41_hematocrit = map['hematocrit'];
    _42_mcv = map['mcv'];
    _43_mch = map['mch'];
    _44_mchc = map['mchc'];
    _45_serumIron = map['serumIron'];
    _46_platelet = map['platelet'];
  }
}