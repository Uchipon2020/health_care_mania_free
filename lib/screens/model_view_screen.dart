import 'package:flutter/material.dart';
import 'package:healthcare_mania_free/screens/graph/weight_graph.dart';
import '../ads/google_mobile_ads.dart';
import '../models/model.dart';
import 'graph/blood_pressure_graph.dart';

class ModelViewScreen extends StatefulWidget {
  final String appBarTitle;
  final Model model;
  final List<Model> modelList;

  const ModelViewScreen(
      {super.key,
      required this.appBarTitle,
      required this.model,
      required this.modelList});

  @override
  State<ModelViewScreen> createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  static final _priorities = ['定期健康診断', '人間ドック', '独自検査'];
  late Map<int, String> modelViews;

  @override
  void initState() {
    super.initState();
    modelViews = {
      99: _priorities[widget.model.priority - 1],
      1: widget.model.height_1,
      2: widget.model.weight_2,
      3: widget.model.waist_3,
      4: widget.model.right_eye_4,
      5: widget.model.left_eye_5,
      6: widget.model.hearing_right_1000_6,
      7: widget.model.hearing_left_1000_7,
      8: widget.model.hearing_right_4000_8,
      9: widget.model.hearing_left_4000_9,
      10: widget.model.x_ray_10,
      11: widget.model.low_blood_pressure_11,
      12: widget.model.high_blood_pressure_12,
      13: widget.model.red_blood_13,
      14: widget.model.hemoglobin_14,
      15: widget.model.got_15,
      16: widget.model.gpt_16,
      17: widget.model.gtp_17,
      18: widget.model.ldl_18,
      19: widget.model.hdl_19,
      20: widget.model.neutral_fat_20,
      21: widget.model.blood_glucose_21,
      22: widget.model.hA1c_22,
      23: widget.model.ecg_23,
      //24
      25: widget.model.urine_25,
      26: widget.model.sugar_26,
      27: widget.model.correctedEyesightRight_27,
      28: widget.model.correctedEyesightLeft_28,
      29: widget.model.lateBlood_29,
      30: widget.model.bloodInTheStool_30,
      31: widget.model.totalProtein_31,
      32: widget.model.albumin_32, //32
      33: widget.model.totalBilirubin_33,
      34: widget.model.alp_34,
      35: widget.model.totalCholesterol_35,
      36: widget.model.uricAcid_36,
      37: widget.model.ureaNitrogen_37,
      38: widget.model.creatinine_38,
      39: widget.model.amylase_39,
      40: widget.model.whiteBloodCell_40,
      41: widget.model.hematocrit_41,
      42: widget.model.mcv_42,
      43: widget.model.mch_43,
      44: widget.model.mchc_44,
      45: widget.model.serumIron_45,
      46: widget.model.platelet_46,
      47: widget.model.internal_47,
    };
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 99; i++) {
      if (modelViews[i] == '') {
        modelViews[i] = ' -- ';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.appBarTitle} : ${widget.model.on_the_day_24} 実施分'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          //Text('検査種別: ${modelViews[99]!}'),
          Card(
            elevation: 0.0,
            child: Text(
              '身長: ${modelViews[1]!} cm',
              style: TextStyle(
                fontWeight: weightCheck(1),
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          WeightGraph(modelList: widget.modelList)));
                },
                child: Card(
                  elevation: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '体重: ${modelViews[2]!} kg',
                        style: TextStyle(
                          fontWeight: weightCheck(2),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: Icon(Icons.auto_graph_sharp),
              ),
            ],
          ),
          Card(
            elevation: 0.0,
            child: Text(
              '腹囲: ${modelViews[3]!} cm',
              style: TextStyle(
                fontWeight: weightCheck(3),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Column(children: [
              Row(
                children: [
                  Text(
                    '右目（矯正）：${modelViews[27]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(27),
                    ),
                  ),
                  Text(
                    '/ 左目（矯正）：${modelViews[28]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(28),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '右目（裸眼）：${modelViews[4]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(4),
                    ),
                  ),
                  Text(
                    '/ 左目（裸眼）：${modelViews[5]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(5),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Card(
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '右聴力 1000Mz：${modelViews[6]!}',
                  style: TextStyle(
                    fontWeight: weightCheck(6),
                  ),
                ),
                Text(
                  '左聴力 1000Mz：${modelViews[7]!}',
                  style: TextStyle(
                    fontWeight: weightCheck(7),
                  ),
                ),
                Text(
                  '右聴力 4000Mz：${modelViews[8]!}',
                  style: TextStyle(
                    fontWeight: weightCheck(8),
                  ),
                ),
                Text(
                  '左聴力 4000Mz：${modelViews[9]!}',
                  style: TextStyle(
                    fontWeight: weightCheck(9),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          BloodPressureGraph(modelList: widget.modelList)));
                },
                child: Card(
                  elevation: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '血圧（上・収縮機）: ${modelViews[12]!} mmHg',
                        style: TextStyle(
                          fontWeight: weightCheck(12),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '血圧（下・拡張期）: ${modelViews[11]!} mmHg',
                        style: TextStyle(
                          fontWeight: weightCheck(11),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: Icon(Icons.auto_graph),
              ),
            ],
          ),
          Card(
            elevation: 0.0,
            child: Text(
              'X-線検査：${modelViews[10]!}',
              style: TextStyle(
                fontWeight: weightCheck(10),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Text(
              '心電図検査所見：${modelViews[23]!}',
              style: TextStyle(
                fontWeight: weightCheck(23),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Text(
              '内科診察所見：${modelViews[47]!}',
              style: TextStyle(
                fontWeight: weightCheck(47),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 0,
            indent: 20,
            endIndent: 0,
          ),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.red)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('血液検査',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
              ),
              Expanded(child: Divider(color: Colors.red)),
            ],
          ),
          if ([31, 32].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      '血清蛋白',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[31] != ' -- ')
                    Text(
                      '総蛋白：${modelViews[31]!}g/dL',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: weightCheck(31),
                      ),
                    ),
                  if (modelViews[32] != ' -- ')
                    Text(
                      'アルブミン：${modelViews[32]!} g/dL',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: weightCheck(32),
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(
            height: 3.0,
          ),
          if ([33, 15, 16, 17, 34].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '肝機能',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (modelViews[33] != ' -- ')
                    Text(
                      '総ビリルビン：${modelViews[33]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(33),
                      ),
                    ),
                  if (modelViews[15] != ' -- ')
                    Text(
                      'GOT（ALT)：${modelViews[15]!} U/L',
                      style: TextStyle(
                        fontWeight: weightCheck(15),
                      ),
                    ),
                  if (modelViews[16] != ' -- ')
                    Text(
                      'GPT（AST)：${modelViews[16]!} U/L',
                      style: TextStyle(
                        fontWeight: weightCheck(16),
                      ),
                    ),
                  if (modelViews[34] != ' -- ')
                    Text(
                      'ALP：${modelViews[34]!} U/L',
                      style: TextStyle(
                        fontWeight: weightCheck(34),
                      ),
                    ),
                  if (modelViews[17] != ' -- ')
                    Text(
                      'γ-GTP：${modelViews[17]!} U/L',
                      style: TextStyle(
                        fontWeight: weightCheck(17),
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([
            35,
            18,
            19,
            20,
          ].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '脂質',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (modelViews[35] != ' -- ')
                    Text(
                      '総コレステロール：${modelViews[35]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(35),
                      ),
                    ),
                  if (modelViews[18] != ' -- ')
                    Text(
                      'ＬＤＬ: ${modelViews[18]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(18),
                      ),
                    ),
                  if (modelViews[19] != ' -- ')
                    Text(
                      'ＨＤＬ: ${modelViews[19]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(19),
                      ),
                    ),
                  if (modelViews[20] != ' -- ')
                    Text(
                      '中性脂肪：${modelViews[20]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(20),
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([
            36,
          ].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '尿酸',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[36] != ' -- ')
                    Text(
                      '尿酸：${modelViews[36]!}',
                      style: TextStyle(
                        fontWeight: weightCheck(36),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([37, 38].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '腎機能',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[37] != ' -- ')
                    Text(
                      '尿素窒素：${modelViews[37]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(37),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[38] != ' -- ')
                    Text(
                      'クレアチニン：${modelViews[38]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(38),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([39].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text('アミラーゼ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  if (modelViews[39] != ' -- ')
                    Text('アミラーゼ：${modelViews[39]!} U/L',
                        style: TextStyle(
                          fontWeight: weightCheck(39),
                        ),
                        textAlign: TextAlign.left),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([
            21,
            22,
          ].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '糖代謝',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[21] != ' -- ')
                    Text(
                      '空腹時血糖：${modelViews[21]!} mg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(21),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[22] != ' -- ')
                    Text(
                      'HbA1c：${modelViews[22]!} %',
                      style: TextStyle(
                        fontWeight: weightCheck(22),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([40].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '白血球数',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[40] != ' -- ')
                    Text(
                      '白血球数: ${modelViews[40]!} /μL',
                      style: TextStyle(
                        fontWeight: weightCheck(40),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([13, 14, 41, 42, 43, 44, 45].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '貧血',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[13] != ' -- ')
                    Text(
                      '赤血球数: ${modelViews[13]!} 万/μL',
                      style: TextStyle(
                        fontWeight: weightCheck(13),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[14] != ' -- ')
                    Text(
                      '血色素量：${modelViews[14]!} g/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(14),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[41] != ' -- ')
                    Text(
                      'ヘマトクリット：${modelViews[41]!} %',
                      style: TextStyle(
                        fontWeight: weightCheck(41),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[42] != ' -- ')
                    Text(
                      'ＭＣＶ：${modelViews[42]!} fL',
                      style: TextStyle(
                        fontWeight: weightCheck(42),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[43] != ' -- ')
                    Text(
                      'ＭＣＨ：${modelViews[43]!} fL',
                      style: TextStyle(
                        fontWeight: weightCheck(43),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[44] != ' -- ')
                    Text(
                      'ＭＣＨＣ：${modelViews[44]!} %',
                      style: TextStyle(
                        fontWeight: weightCheck(44),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  if (modelViews[45] != ' -- ')
                    Text(
                      '血清鉄：${modelViews[45]!} μg/dL',
                      style: TextStyle(
                        fontWeight: weightCheck(45),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const SizedBox(height: 3.0),
          if ([46].any((i) => modelViews[i] != ' -- '))
            Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text(
                      '血小板',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (modelViews[46] != ' -- ')
                    Text(
                      '血小板：${modelViews[46]!}  万/μL',
                      style: TextStyle(
                        fontWeight: weightCheck(46),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 0,
            indent: 20,
            endIndent: 0,
          ),
          const SizedBox(
            height: 3.0,
          ),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.teal)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '検尿・検便',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Divider(color: Colors.teal)),
            ],
          ),
          Card(
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: const Text(
                    '尿潜血',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                if (modelViews[26] != ' -- ')
                  Text(
                    '尿糖：${modelViews[26]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(26),
                    ),
                    textAlign: TextAlign.left,
                  ),
                if (modelViews[25] != ' -- ')
                  Text(
                    '尿蛋白：${modelViews[25]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(25),
                    ),
                    textAlign: TextAlign.left,
                  ),
                if (modelViews[29] != ' -- ')
                  Text(
                    '尿潜血：${modelViews[29]!}',
                    style: TextStyle(
                      fontWeight: weightCheck(29),
                    ),
                    textAlign: TextAlign.left,
                  ),
                Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: const Text(
                    '便検査',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                if (modelViews[30] != ' -- ')
                  Text(
                    '便潜血：${modelViews[30]!},',
                    style: TextStyle(
                      fontWeight: weightCheck(30),
                    ),
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
          ),
          Card(
            color: Colors.amber[50],
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.orange),
              title: const Text('有料版でもっと便利に'),
              subtitle: const Text('基準値ハイライト・比較・ダッシュボード・CSV出力'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showUpgradeDialog(context),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const AdBannerWidget(),
    );
  }

  void _showUpgradeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('有料版の機能です'),
        content: const Text(
          '・基準値超えの赤ハイライト\n'
          '・前回との比較（▲▼表示）\n'
          '・ダッシュボード画面\n'
          '・眼科・腫瘍マーカー項目\n\n'
          '有料版にアップグレードすると\nすべての機能が使えます。',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('有料版を見る'),
          ),
        ],
      ),
    );
  }

  FontWeight weightCheck(int inside) {
    return modelViews[inside] == ' -- ' ? FontWeight.normal : FontWeight.bold;
  }
}
