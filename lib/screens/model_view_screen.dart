import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/model.dart';
import '../utils/database_helper.dart';

class ModelViewScreen extends StatefulWidget {
  final String appBarTitle;
  final Model model;
  const ModelViewScreen(
      {Key? key, required this.appBarTitle, required this.model})
      : super(key: key);
  @override
  State<ModelViewScreen> createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  static final _priorities = ['定期健康診断', '人間ドック', '独自検査'];
  DatabaseHelper helper = DatabaseHelper();
  dynamic dateNow;
  dynamic dateFormat;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController rEyeController = TextEditingController();
  TextEditingController lEyeController = TextEditingController();
  TextEditingController lBpController = TextEditingController();
  TextEditingController hBpController = TextEditingController();
  TextEditingController onTheDayController = TextEditingController();
  TextEditingController hR1000Controller = TextEditingController();
  TextEditingController hL1000Controller = TextEditingController();
  TextEditingController hR4000Controller = TextEditingController();
  TextEditingController hL4000Controller = TextEditingController();
  TextEditingController xRayController = TextEditingController();
  TextEditingController rBController = TextEditingController();
  TextEditingController hEmoController = TextEditingController();
  TextEditingController gOtController = TextEditingController();
  TextEditingController gPtController = TextEditingController();
  TextEditingController gTpController = TextEditingController();
  TextEditingController lDlController = TextEditingController();
  TextEditingController hDlController = TextEditingController();
  TextEditingController nFatController = TextEditingController();
  TextEditingController bGluController = TextEditingController();
  TextEditingController hA1cController = TextEditingController();
  TextEditingController eCgController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController urineController = TextEditingController();
  //
  final waistController = TextEditingController();
  final correctEyeRController = TextEditingController();
  final correctEyeLController = TextEditingController();
  final latentBloodController = TextEditingController();
  final bloodInTheStoolController = TextEditingController();
  final totalProteinController = TextEditingController();
  final albuminController = TextEditingController();
  final totalBilirubinController = TextEditingController();
  final alpController = TextEditingController();
  final totalCholesterolController = TextEditingController();
  final uricAcidController = TextEditingController();
  final ureaNitrogenController = TextEditingController();
  final creatinineController = TextEditingController();
  final amylaseController = TextEditingController();
  final whiteBloodCellController = TextEditingController();
  final hematocritController = TextEditingController();
  final mcvController = TextEditingController();
  final mchController = TextEditingController();
  final mchcController = TextEditingController();
  final serumIronController = TextEditingController();
  final plateletController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateFormat = DateTime.now();
    dateNow = DateFormat("yyyy年MM月dd日").format(dateFormat);

    heightController.text = widget.model.height_1;
    weightController.text = widget.model.weight_2;
    rEyeController.text = widget.model.right_eye_4;
    lEyeController.text = widget.model.left_eye_5;
    lBpController.text = widget.model.low_blood_pressure_11;
    hBpController.text = widget.model.high_blood_pressure_12;
    onTheDayController.text = widget.model.on_the_day_24;
    hR1000Controller.text = widget.model.hearing_right_1000_6;
    hL1000Controller.text = widget.model.hearing_left_1000_7;
    hR4000Controller.text = widget.model.hearing_right_4000_8;
    hL4000Controller.text = widget.model.hearing_left_4000_9;
    xRayController.text = widget.model.x_ray_10;
    rBController.text = widget.model.red_blood_13;
    hEmoController.text = widget.model.hemoglobin_14;
    gOtController.text = widget.model.got_15;
    gPtController.text = widget.model.gpt_16;
    gTpController.text = widget.model.gpt_16;
    lDlController.text = widget.model.ldl_18;
    hDlController.text = widget.model.hdl_19;
    nFatController.text = widget.model.neutral_fat_20;
    bGluController.text = widget.model.blood_glucose_21;
    hA1cController.text = widget.model.hA1c_22;
    eCgController.text = widget.model.ecg_23;
    //
    waistController.text = widget.model.waist_3;
    correctEyeRController.text = widget.model.correctedEyesightRight_27;
    correctEyeLController.text = widget.model.correctedEyesightLeft_28;
    latentBloodController.text = widget.model.lateBlood_29;
    bloodInTheStoolController.text = widget.model.bloodInTheStool_30;
    totalProteinController.text = widget.model.totalProtein_31;
    albuminController.text = widget.model.albumin_32; //32
    totalBilirubinController.text = widget.model.totalBilirubin_33;
    alpController.text = widget.model.alp_34;
    totalCholesterolController.text = widget.model.totalCholesterol_35;
    uricAcidController.text = widget.model.uricAcid_36;
    ureaNitrogenController.text = widget.model.ureaNitrogen_37;
    creatinineController.text = widget.model.creatinine_38;
    amylaseController.text = widget.model.amylase_39;
    whiteBloodCellController.text = widget.model.whiteBloodCell_40;
    hematocritController.text = widget.model.hematocrit_41;
    mcvController.text = widget.model.mcv_42;
    mchController.text = widget.model.mch_43;
    mchcController.text = widget.model.mchc_44;
    serumIronController.text = widget.model.serumIron_45;
    plateletController.text = widget.model.platelet_46;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    if (onTheDayController.text == null) {
      onTheDayController.text = DateFormat("yyyy年MM月dd日").format(dateFormat);
      if (kDebugMode) {
        print('$dateFormat');
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            /*ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        dropDownStringItem,
                        style: const TextStyle(
                          fontSize: 20.5,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                style: textStyle,
                value: getPriorityAsString(widget.model.priority),
                onChanged: (String? value) {
                  setState(() {
                    updatePriorityAsInt(value!);
                  });
                },
              ),
            ),*/
            // 24 Element　受診日
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: TextField(
                enabled: false,
                focusNode: AlwaysDisabledFocusNode(),
                controller: onTheDayController,
                style: textStyle,
                textAlign: TextAlign.right,
                onTap: () {
                  _selectDate(context);
                  debugPrint('オンタップでカレンダーが表示されているはず');
                  onTheDayController.text = dateNow;
                },
                onChanged: (value) {
                  setState(() {
                    onTheDayController.text = dateNow;
                  });
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: '受診日',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  icon: const Icon(Icons.calendar_today_outlined),
                ),
              ),
            ),
            // Second Element　身長入力
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                enabled: false,
                controller: heightController,
                style: textStyle,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  updateHeight();
                },
                decoration: InputDecoration(
                    labelText: '身長',
                    labelStyle: textStyle,
                    suffix: const Text(' cm'),
                    icon: const Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            // Third Element　体重入力
            Padding(
              padding: const EdgeInsets.only(top: 2.5, bottom: 10.0),
              child: TextField(
                enabled: false,
                controller: weightController,
                style: textStyle,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  debugPrint('Something changed in Description Text Field');
                  updateWeight();
                },
                decoration: InputDecoration(
                    labelText: '体重',
                    labelStyle: textStyle,
                    suffix: const Text(' kg'),
                    icon: const Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            //腹囲入力
            Padding(
              padding: const EdgeInsets.only(top: 2.5, bottom: 10.0),
              child: TextField(
                enabled: false,
                controller: waistController,
                style: textStyle,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  updateWaist();
                },
                decoration: InputDecoration(
                    labelText: '腹囲',
                    labelStyle: textStyle,
                    suffix: const Text(' cm'),
                    icon: const Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            //視力横並び表示-------------------
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 3 Element　（右）視力入力
                    child: TextField(
                      enabled: false,
                      controller: rEyeController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateREye();
                      },
                      decoration: InputDecoration(
                        labelText: '右視力',
                        icon: const Icon(Icons.remove_red_eye),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    // 5 Element　（左）視力入力
                    child: TextField(
                      enabled: false,
                      controller: lEyeController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateLEye();
                      },
                      decoration: InputDecoration(
                        labelText: '左視力',
                        icon: const Icon(Icons.remove_red_eye),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 3 Element　（右）矯正視力入力
                    child: TextField(
                      enabled: false,
                      controller: correctEyeRController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateCorrectER();
                      },
                      decoration: InputDecoration(
                        labelText: '矯正(右）',
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    // 5 Element　（左）矯正視力入力
                    child: TextField(
                      enabled: false,
                      controller: correctEyeLController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateCorrectEL();
                      },
                      decoration: InputDecoration(
                        labelText: '矯正（左）',
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //聴力1000Hz
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 2.5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 3 Element　聴力1000Hz　右
                    child: TextField(
                      enabled: false,
                      controller: hR1000Controller,
                      style: textStyle,
                      //keyboardType:TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateHearing_r_1000();
                      },
                      decoration: InputDecoration(
                        labelText: '右聴力1000',
                        labelStyle: textStyle,
                        icon: const Icon(Icons.hearing),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    // 5 Element　聴力1000　左
                    child: TextField(
                      enabled: false,
                      controller: hL1000Controller,
                      style: textStyle,
                      // keyboardType:TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateHearing_l_1000();
                      },
                      decoration: InputDecoration(
                        labelText: '左聴力1000',
                        labelStyle: textStyle,
                        icon: const Icon(Icons.hearing),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //聴力4000Hz
            Padding(
              padding: const EdgeInsets.only(top: 2.5, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 3 Element　聴力4000Hz　右
                    child: TextField(
                      enabled: false,
                      controller: hR4000Controller,
                      style: textStyle,
                      //keyboardType:TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateHearing_r_4000();
                      },

                      decoration: InputDecoration(
                        labelText: '右聴力4000',
                        icon: const Icon(Icons.hearing),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    // 5 Element　聴力4000　左
                    child: TextField(
                      enabled: false,
                      controller: hL4000Controller,
                      style: textStyle,
                      //keyboardType:TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateHearing_l_4000();
                      },
                      decoration: InputDecoration(
                        labelText: '左聴力4000',
                        labelStyle: textStyle,
                        icon: const Icon(Icons.hearing),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //血圧横並び表示----------------
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 6 Element　血圧（LOW）
                    child: TextField(
                      enabled: false,
                      controller: lBpController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateLBp();
                      },
                      decoration: InputDecoration(
                          labelText: '血圧Low',
                          labelStyle: textStyle,
                          suffix: const Text(' mmHg'),
                          icon: const Icon(Icons.arrow_downward),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    // 7 Element　血圧（High）
                    child: TextField(
                      enabled: false,
                      controller: hBpController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint(
                            'Something changed in Description Text Field');
                        updateHBp();
                      },
                      decoration: InputDecoration(
                          labelText: '血圧High',
                          labelStyle: textStyle,
                          suffix: const Text(' mmHg'),
                          icon: const Icon(Icons.arrow_upward),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ],
              ),
            ),
            // x線検査
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                enabled: false,
                controller: xRayController,
                style: textStyle,
                //keyboardType:TextInputType.number,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  updateXray();
                },
                decoration: InputDecoration(
                    labelText: 'レントゲン検査所見',
                    icon: const Icon(Icons.content_paste),
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            // 心電図検査
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                enabled: false,
                controller: eCgController,
                style: textStyle,
                //keyboardType:TextInputType.number,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  updateEcg();
                },
                decoration: InputDecoration(
                    labelText: '心電図検査所見',
                    labelStyle: textStyle,
                    icon: const Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            //　血液検査関係-------------
            //血清蛋白-----------------------------------------
            ExpansionTile(
              title: const Text('血清蛋白'),
              children: [
                //総蛋白
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: totalBilirubinController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateTotalBilirubin();
                    },
                    decoration: InputDecoration(
                        labelText: '総蛋白',
                        labelStyle: textStyle,
                        suffix: const Text(' g/dL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //アルブミン
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: albuminController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateAlbumin();
                      },
                      decoration: InputDecoration(
                          labelText: 'アルブミン',
                          suffix: const Text(' g/dL'),
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
              ],
            ),
            //肝機能----------------------------------------------
            ExpansionTile(
              title: const Text('肝機能'),
              children: [
                //総ビリルビン
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: totalBilirubinController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: '総ビリルビン',
                        suffix: const Text(' mg/dL'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                // ＧＯＴ
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: gOtController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateGot();
                    },
                    decoration: InputDecoration(
                        labelText: 'ＧＯＴ',
                        labelStyle: textStyle,
                        suffix: const Text(' U/L'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                // ＧＰＴ
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: gPtController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateGpt();
                    },
                    decoration: InputDecoration(
                        labelText: 'ＧＰＴ',
                        labelStyle: textStyle,
                        suffix: const Text(' U/L'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //ALP
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: alpController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: 'ALP',
                        labelStyle: textStyle,
                        suffix: const Text(' U/L'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                // ガンマ
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: gTpController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateGtp();
                    },
                    decoration: InputDecoration(
                        labelText: 'ガンマGPT',
                        labelStyle: textStyle,
                        suffix: const Text(' U/L'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ],
            ),
            //脂質--------------------------------------
            //総コレステロール
            ExpansionTile(title: const Text('脂質'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: totalCholesterolController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTotalCholesterol();
                      },
                      decoration: InputDecoration(
                          labelText: '総コレステロール',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  // LDL
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: lDlController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                        updateLdl();
                      },
                      decoration: InputDecoration(
                          labelText: 'ＬＤＬ',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  // ＨＤＬ
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: hDlController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                        updateHdl();
                      },
                      decoration: InputDecoration(
                          labelText: 'ＨＤＬ',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  // 中性脂肪
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: nFatController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                        updateNeutralfat();
                      },
                      decoration: InputDecoration(
                          labelText: '中性脂肪',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ]),
            //尿酸
            ExpansionTile(
              title: const Text('尿酸'),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    enabled: false,
                    controller: uricAcidController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateUricAcid();
                    },
                    decoration: InputDecoration(
                        labelText: '尿酸',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                const Text(''),
              ],
            ),
            //尿素窒素 //腎機能-------------------------------------
            ExpansionTile(title: const Text('腎機能'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: ureaNitrogenController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateUreaNitrogen();
                      },
                      decoration: InputDecoration(
                          labelText: '尿素窒素',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: sugarController,
                      style: textStyle,
                      //keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateSugar();
                      },
                      decoration: InputDecoration(
                          labelText: '尿糖',
                          labelStyle: textStyle,
                          //suffix: const Text(' g/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: urineController,
                      style: textStyle,
                      //keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateUrine();
                      },
                      decoration: InputDecoration(
                          labelText: '尿蛋白',
                          labelStyle: textStyle,
                          //suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),

                  //クレアチニン
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: creatinineController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateEcg();
                      },
                      decoration: InputDecoration(
                          labelText: 'クレアチニン',
                          labelStyle: textStyle,
                          suffix: const Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  //尿潜血
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: latentBloodController,
                      style: textStyle,
                      //keyboardType:TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateLatentBlood();
                      },
                      decoration: InputDecoration(
                          labelText: '尿潜血',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ]),
            //アミラーゼ
            ExpansionTile(
              title: const Text('アミラーゼ'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: amylaseController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: 'アミラーゼ',
                        labelStyle: textStyle,
                        suffix: const Text(' U/L'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                const Text(''),
              ],
            ),
            // 空腹時血糖//糖代謝--------------------------------------
            ExpansionTile(title: const Text('糖代謝'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: bGluController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                        updateBloodglucose();
                      },
                      decoration: InputDecoration(
                        labelText: '空腹時血糖',
                        labelStyle: textStyle,
                        suffix: const Text(' mg/dL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  // A1c
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: hA1cController,
                      style: textStyle,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                        updateHA1c();
                      },
                      decoration: InputDecoration(
                        labelText: 'hA1c',
                        labelStyle: textStyle,
                        suffix: const Text(' %'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ]),
            //白血球数
            ExpansionTile(
              title: const Text('白血球数'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: whiteBloodCellController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateWhiteBloodCell();
                    },
                    decoration: InputDecoration(
                        labelText: '白血球',
                        labelStyle: textStyle,
                        suffix: const Text(' /μL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                const Text(''),
              ],
            ),
            // 6 Element　赤血球数//貧血--------------------------------------
            ExpansionTile(
              title: const Text('貧血'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: rBController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateRedblood();
                    },
                    decoration: InputDecoration(
                        labelText: '赤血球数',
                        labelStyle: textStyle,
                        suffix: const Text(' 万/μL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                // 7 Element　血色素量
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: hEmoController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateHemo();
                    },
                    decoration: InputDecoration(
                        labelText: '血色素量',
                        labelStyle: textStyle,
                        suffix: const Text(' g/dL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //ヘマトクリット
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: hematocritController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateHematocrit();
                    },
                    decoration: InputDecoration(
                        labelText: 'ヘマトクリット',
                        suffix: const Text(' %'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //MCV
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mcvController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: 'MCV',
                        suffix: const Text(' fL'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //MCH
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mcvController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: 'MCV',
                        labelStyle: textStyle,
                        suffix: const Text(' fL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //MCHC
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mchcController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateMchc();
                    },
                    decoration: InputDecoration(
                        labelText: 'MCHC',
                        labelStyle: textStyle,
                        suffix: const Text(' %'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                //serumIron
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: serumIronController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateEcg();
                    },
                    decoration: InputDecoration(
                        labelText: '血清鉄',
                        labelStyle: textStyle,
                        suffix: const Text('μg/dL'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ],
            ),
            //platelet
            ExpansionTile(
              title: const Text('血小板'),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    enabled: false,
                    controller: plateletController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updatePlatelet();
                    },
                    decoration: InputDecoration(
                        labelText: '血小板数',
                        suffix: const Text(' 万/'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                const Text(''),
              ],
            ),
            //便潜血
            ExpansionTile(
              title: const Text('便潜血'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    controller: bloodInTheStoolController,
                    style: textStyle,
                    //keyboardType:TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateBloodIn();
                    },
                    decoration: InputDecoration(
                        labelText: '便潜血',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                const Text(''),
              ],
            ),
            /* 5 Element　削除　横並び表示
               ---------------------------------------------- */
           /* Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      textStyle: const TextStyle(color: Colors.red)),
                  child: const Text(
                    'Delete',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    setState(() {
                      debugPrint("Delete button clicked");
                      _delete();
                    });
                  },
                ),
              ),
            ),*/
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _save();
          });
        },
        tooltip: 'save',
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.save),
      ),*/
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case '定期健康診断':
        widget.model.priority = 1;
        break;
      case '人間ドック':
        widget.model.priority = 2;
        break;
      case '独自検査':
        widget.model.priority = 3;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority = "";
    switch (value) {
      case 1:
        priority = _priorities[0]; // 'High'
        break;
      case 2:
        priority = _priorities[1]; // 'Low'
        break;
      case 3:
        priority = _priorities[2];
    }
    return priority;
  }

  void updateHeight() {
    widget.model.height_1 = heightController.text;
  }

  void updateWeight() {
    widget.model.weight_2 = weightController.text;
  }

  void updateREye() {
    widget.model.right_eye_4 = rEyeController.text;
  }

  void updateLEye() {
    widget.model.left_eye_5 = lEyeController.text;
  }

  void updateHearing_r_1000() {
    widget.model.hearing_right_1000_6 = hR1000Controller.text;
  }

  void updateHearing_l_1000() {
    widget.model.hearing_left_1000_7 = hL1000Controller.text;
  }

  void updateHearing_r_4000() {
    widget.model.hearing_right_4000_8 = hR4000Controller.text;
  }

  void updateHearing_l_4000() {
    widget.model.hearing_left_4000_9 = hL4000Controller.text;
  }

  void updateXray() {
    widget.model.x_ray_10 = xRayController.text;
  }

  void updateRedblood() {
    widget.model.red_blood_13 = rBController.text;
  }

  void updateHemo() {
    widget.model.hemoglobin_14 = hEmoController.text;
  }

  void updateGot() {
    widget.model.got_15 = gOtController.text;
  }

  void updateGpt() {
    widget.model.gpt_16 = gPtController.text;
  }

  void updateGtp() {
    widget.model.gtp_17 = gTpController.text;
  }

  void updateLdl() {
    widget.model.ldl_18 = lDlController.text;
  }

  void updateHdl() {
    widget.model.hdl_19 = hDlController.text;
  }

  void updateNeutralfat() {
    widget.model.neutral_fat_20 = nFatController.text;
  }

  void updateBloodglucose() {
    widget.model.blood_glucose_21 = bGluController.text;
  }

  void updateHA1c() {
    widget.model.hA1c_22 = hA1cController.text;
  }

  void updateEcg() {
    widget.model.ecg_23 = eCgController.text;
  }

  void updateLBp() {
    widget.model.low_blood_pressure_11 = lBpController.text;
  }

  void updateHBp() {
    widget.model.high_blood_pressure_12 = hBpController.text;
  }

  void updateSugar(){
    widget.model.sugar_26 = sugarController.text;
  }

  void updateUrine(){
    widget.model.urine_25 = urineController.text;
  }

  void updateOTD() {
    widget.model.on_the_day_24 = onTheDayController.text;
    if (kDebugMode) {
      print('${onTheDayController.text}アップデートメソッドの中のテキスト');
    }
    if (kDebugMode) {
      print(widget.model.on_the_day_24);
    }
  }

  ////
  void updateWaist() {
    widget.model.waist_3 = waistController.text;
  } //26

  void updateCorrectER() {
    widget.model.correctedEyesight_right_27 = correctEyeRController.text;
  } //27

  void updateCorrectEL() {
    widget.model.correctedEyesight_left_28 = correctEyeLController.text;
  } //28

  void updateLatentBlood() {
    widget.model.latentBlood_29 = latentBloodController.text;
  } //29

  void updateBloodIn() {
    widget.model.bloodInTheStool_30 = bloodInTheStoolController.text;
  } //30

  void updateTotalProtein() {
    widget.model.totalProtein_31 = totalProteinController.text;
  } //31

  void updateAlbumin() {
    widget.model.albumin_32 = albuminController.text;
  }

  void updateTotalBilirubin() {
    widget.model.totalBilirubin_33 = totalBilirubinController.text;
  }

  void updateAlp() {
    widget.model.alp_34 = alpController.text;
  }

  void updateTotalCholesterol() {
    widget.model.totalCholesterol_35 = totalCholesterolController.text;
  }

  void updateUricAcid() {
    widget.model.uricAcid_36 = uricAcidController.text;
  }

  void updateUreaNitrogen() {
    widget.model.ureaNitrogen_37 = ureaNitrogenController.text;
  }

  void updateCreatinine() {
    widget.model.creatinine_38 = creatinineController.text;
  }

  void updateAmylase() {
    widget.model.amylase_39 = amylaseController.text;
  }

  void updateWhiteBloodCell() {
    widget.model.whiteBloodCell_40 = whiteBloodCellController.text;
  }

  void updateHematocrit() {
    widget.model.hematocrit_41 = hematocritController.text;
  }

  void updateMcv() {
    widget.model.mcv_42 = mcvController.text;
  }

  void updateMch() {
    widget.model.mch_43 = mchController.text;
  }

  void updateMchc() {
    widget.model.mchc_44 = mchcController.text;
  }

  void updateSerumIron() {
    widget.model.serumIron_45 = serumIronController.text;
  }

  void updatePlatelet() {
    widget.model.platelet_46 = plateletController.text;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        locale: const Locale("ja"),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now().add(const Duration(days: 720)));
    if (selected != null) {
      setState(
            () => dateNow = DateFormat("yyyy年MM月dd日").format(selected).toString(),
      );
      debugPrint('$dateNow');
      //note.on_the_day = onTheDayController.text;
      onTheDayController.text = dateNow;
      updateOTD();
    }
  }

  /*void _save() async {
    moveToLastScreen();

    widget.model.date = DateFormat.yMMMd().format(DateTime.now());
    debugPrint(widget.model.on_the_day_24);
    int result;
    if (widget.model.id != null) {
      result = await helper.updateModel(widget.model);
    } else {
      result = await helper.insertModel(widget.model);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('状況', '保存完了！！');
    } else {
      // Failure
      _showAlertDialog('状況', '問題発生・保存されませんでした');
    }
  }*/

  void _delete() async {
    moveToLastScreen();
    if (widget.model.id == null) {
      _showAlertDialog('状況', '削除データなし');
      return;
    }
    int result = await helper.deleteModel(widget.model.id!);
    if (result != 0) {
      _showAlertDialog('状況', 'データ削除完了');
    } else {
      _showAlertDialog('状況', '問題発生・データ削除不可');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
