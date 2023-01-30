import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_mania_legacy_new/models/model.dart';
import 'package:healthcare_mania_legacy_new/utils/database_helper.dart';
import 'package:intl/intl.dart';

class ModelViewScreen extends StatefulWidget {
  final String appBarTitle;
  final Model model;
  const ModelViewScreen({Key key, this.appBarTitle, this.model}) : super(key:key);

  @override
  State<ModelViewScreen> createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  static final _priorities = ['定期健康診断', '人間ドック', '独自検査'];

  DatabaseHelper helper = DatabaseHelper();
  dynamic dateNow;
  dynamic dateFormat;

  @override
  void initState(){
    super.initState();
    dateFormat = DateTime.now();
    dateNow = DateFormat("yyyy年MM月dd日").format(dateFormat);}


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

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

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
    if (onTheDayController.text == null) {
      onTheDayController.text =
          DateFormat("yyyy年MM月dd日").format(dateFormat);
      if (kDebugMode) {
        print('$dateFormat');
      }
    }

    return Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.appBarTitle),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // First element　定期健康診断か人間ドックかプルダウンで選ぶ
                ListTile(
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
                    value: getPriorityAsString(widget.model.priority), onChanged: (String value) {  },
                  ),
                ),
                // 24 Element　受診日
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child:TextField(
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: onTheDayController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    enabled: false,
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
                  //Text("$dateNow"),
                ),
                // Second Element　身長入力
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    controller: heightController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    enabled: false,
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
                    controller: weightController,
                    style: textStyle,
                    textAlign: TextAlign.right,
                    enabled: false,

                    decoration: InputDecoration(
                        labelText: '体重',
                        labelStyle: textStyle,
                        suffix: const Text(' kg'),
                        icon: const Icon(Icons.accessibility),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                //視力横並び表示-------------------
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // 3 Element　（右）視力入力
                        child: TextField(
                          controller: rEyeController,
                          style: textStyle,
                          enabled: false,

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
                          controller: lEyeController,
                          style: textStyle,
                          enabled: false,

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

                //聴力1000Hz

                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2.5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // 3 Element　聴力1000Hz　右
                        child: TextField(
                          controller: hR1000Controller,
                          style: textStyle,
                          enabled: false,

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
                          controller: hL1000Controller,
                          style: textStyle,
                          enabled: false,

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
                          controller: hR4000Controller,
                          style: textStyle,
                          enabled: false,

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
                          controller: hL4000Controller,
                          style: textStyle,
                          enabled: false,

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
                          controller: lBpController,
                          style: textStyle,
                          enabled: false,
                          textAlign: TextAlign.right,

                          decoration: InputDecoration(
                              labelText: '血圧Low',
                              labelStyle: textStyle,
                              enabled: false,
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
                          controller: hBpController,
                          style: textStyle,
                          textAlign: TextAlign.right,
                          enabled: false,
                          decoration: InputDecoration(
                              labelText: '血圧High',
                              labelStyle: textStyle,
                              enabled: false,
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
                    controller: xRayController,
                    style: textStyle,
                    enabled: false,

                    decoration: InputDecoration(
                        labelText: 'レントゲン検査所見',
                        icon: const Icon(Icons.content_paste),
                        labelStyle: textStyle,
                        enabled: false,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                // 心電図検査
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    controller: eCgController,
                    style: textStyle,
                    enabled: false,
                    decoration: InputDecoration(
                        labelText: '心電図検査所見',
                        labelStyle: textStyle,
                        enabled: false,
                        icon: const Icon(Icons.accessibility),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                /*コンテナ＋Columnで血液検査をまとめる。
                //赤血球数・血色素量----------------
                 -----------------------------------------------------------------------------------------------------
                 -----------------------------------------------------------------------------------------------------
                 */
                Container(
                  //margin: EdgeInsets.all(1.0),

                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFCE4EC),
                      borderRadius: BorderRadius.circular(5.0)),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:2.5,bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // 6 Element　赤血球数
                              child: TextField(
                                controller: rBController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: '赤血球数',
                                    labelStyle: textStyle,
                                    suffix: const Text(' 万/μL'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // 7 Element　血色素量
                              child: TextField(
                                controller: hEmoController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: '血色素量',
                                    labelStyle: textStyle,
                                    suffix: const Text(' g/dL'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //肝機能検査　横並び３つ- GOT/GPT/rGPT---------------
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // ＧＯＴ
                              child: TextField(
                                controller: gOtController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: 'ＧＯＴ',
                                    labelStyle: textStyle,
                                    suffix: const Text(' U/L'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // ＧＰＴ
                              child: TextField(
                                controller: gPtController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: 'ＧＰＴ',
                                    labelStyle: textStyle,
                                    suffix: const Text(' U/L'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // ガンマ
                              child: TextField(
                                controller: gTpController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: 'ガンマGPT',
                                    labelStyle: textStyle,
                                    suffix: const Text(' U/L'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //ＬＤＬとＨＤＬ----------------
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // LDL
                              child: TextField(
                                controller: lDlController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: 'ＬＤＬ',
                                    labelStyle: textStyle,
                                    suffix: const Text(' mg/dL'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // ＨＤＬ
                              child: TextField(
                                controller: hDlController,
                                style: textStyle,
                                enabled: false,

                                decoration: InputDecoration(
                                    labelText: 'ＨＤＬ',
                                    labelStyle: textStyle,
                                    suffix: const Text(' mg/dL'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // 中性脂肪
                              child: TextField(
                                controller: nFatController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                    labelText: '中性脂肪',
                                    labelStyle: textStyle,
                                    suffix: const Text(' mg/dL'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //血糖検査
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0,bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // 空腹時血糖
                              child: TextField(
                                controller: bGluController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                  labelText: '空腹時血糖',
                                  labelStyle: textStyle,
                                  suffix: const Text(' mg/dL'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // A1c
                              child: TextField(
                                controller: hA1cController,
                                style: textStyle,
                                enabled: false,
                                textAlign: TextAlign.right,

                                decoration: InputDecoration(
                                  labelText: 'hA1c',
                                  labelStyle: textStyle,
                                  suffix: const Text(' %'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
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

  // Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String priority;
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
/*
  // Update the title of Note object
  void updateHeight() {
    widget.model.height_1 = heightController.text;
  }

  // Update the title of Note object
  void updateWeight() {
    widget.model.weight_2 = weightController.text;
  }

  // Update the right_eyes of Note object
  void updateREye() {
    widget.model.right_eye_4 = rEyeController.text;
  }

  // Update the left_eyes of Note object
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

  // Update the low_blood_pressure of Note object
  void updateLBp() {
    widget.model.low_blood_pressure_11 = lBpController.text;
  }

  // Update the high_blood_pressure of Note object
  void updateHBp() {
    widget.model.high_blood_pressure_12 = hBpController.text;
  }

  // Update the on_the_day of Note object
  void updateOTD() {
    widget.model.on_the_day_24 = onTheDayController.text;
    if (kDebugMode) {
      print('${onTheDayController.text}アップデートメソッドの中のテキスト');
    }
    if (kDebugMode) {
      print(widget.model.on_the_day_24);
    }
  }*/
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
