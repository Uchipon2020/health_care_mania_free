import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/model.dart';
import '../utils/database_helper.dart';

class ModelDetailScreen extends StatefulWidget {
  final String appBarTitle;
  final Model model;
  const ModelDetailScreen({Key? key, required this.appBarTitle, required this.model})
      : super(key: key);
  @override
  State<ModelDetailScreen> createState() => _ModelDetailScreenState();
}

class _ModelDetailScreenState extends State<ModelDetailScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
      onTheDayController.text = DateFormat("yyyy年MM月dd日").format(dateFormat);
      if (kDebugMode) {
        print('$dateFormat');
      }

    return  Scaffold(
          appBar: AppBar(
            title: Text(widget.appBarTitle),
            automaticallyImplyLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
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
                    value: getPriorityAsString(widget.model.priority),
                    onChanged: (String? value) {  },
                  ),
                ),
                // 24 Element　受診日
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: TextField(
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
                        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // 6 Element　赤血球数
                              child: TextField(
                                controller: rBController,
                                style: textStyle,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateRedblood();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateHemo();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateGot();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateGpt();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateGtp();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateLdl();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateHdl();
                                },
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
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
                                  updateNeutralfat();
                                },
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
                        padding: const EdgeInsets.only(top: 15.0, bottom: 2.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              // 空腹時血糖
                              child: TextField(
                                controller: bGluController,
                                style: textStyle,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
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
                            Container(
                              width: 5.0,
                            ),
                            Expanded(
                              // A1c
                              child: TextField(
                                controller: hA1cController,
                                style: textStyle,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(
                                      'Something changed in Description Text Field');
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /* 5 Element　保存と削除　横並び表示
               ---------------------------------------------- */
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // ignore: deprecated_member_use
                        child: ElevatedButton(
                          /* color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,*/
                          child: const Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                        // ignore: deprecated_member_use
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              /* color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,*/
                              ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    String priority= "";
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
  void updateOTD() {
    widget.model.on_the_day_24 = onTheDayController.text;
    if (kDebugMode) {
      print('${onTheDayController.text}アップデートメソッドの中のテキスト');
    }
    if (kDebugMode) {
      print(widget.model.on_the_day_24);
    }
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

  void _save() async {
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
  }
  void _delete() async {
    if (widget.model.id == null) {
      _showAlertDialog('状況', '削除データなし');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
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
