import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/model.dart';

class BloodPressureGraph extends StatefulWidget {
  List<Model>? modelList;
  BloodPressureGraph({required this.modelList, Key? key}) : super(key: key);

  @override
  State<BloodPressureGraph> createState() => _BloodPressureGraphState();
}

class _BloodPressureGraphState extends State<BloodPressureGraph> {
  List<double>? highBloodPressureDataList;
  List<double>? lowBloodPressureDataList;
  List<String>? xAxisLabels;

  late FlTitlesData _titles;
  final TextStyle _labelStyle =
  const TextStyle(fontSize: 13, fontWeight: FontWeight.w800);
  final TextStyle _titleStyle =
  const TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  void _initChartTitle() {
    _titles = FlTitlesData(
      topTitles: AxisTitles(
          axisNameWidget: Text(
            "Your Blood Presser",
            style: _titleStyle,
          ),
          axisNameSize: 48),
      rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          )),
      bottomTitles: AxisTitles(
        sideTitles: _bottomTitles,
        axisNameWidget: Container(
          alignment: Alignment.centerRight,
          child: Text(
            "登録日",
            style: _labelStyle,
          ),
        ),
      ),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, titleMeta) {
              return Text(
                value.toStringAsFixed(0),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              );
            },
          ),
          axisNameWidget: Text(
            "血圧",
            style: _labelStyle,
          ),
          axisNameSize: 32),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 50,
    getTitlesWidget: (value, meta) {
      String text = '';
      List<String> xAxisLabels = _getXAxisLabels();
      if (value >= 0 && value < xAxisLabels.length) {
        text = xAxisLabels[value.toInt()];
      }
      return Text(text);
    },
    interval: 1,
  );

  List<String> _getXAxisLabels() {
    List<String> xAxisLabels = [];
    for (int i = 0; i < highBloodPressureDataList!.length; i++) {
      String dateStr =
          widget.modelList![i].on_the_day_24; // 'date' フィールドから日付文字列を取得
      DateTime originalData = DateFormat('yyyy年M月d日').parse(dateStr);
      String formattedDatSter = DateFormat('yy.M.dd').format(originalData);
      xAxisLabels.add(formattedDatSter);
    }
    return xAxisLabels;
  }

  @override
  void initState() {
    super.initState();
    _generateDataLists();
    _initChartTitle();
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> highflSpotList = [];
    List<FlSpot> lowflSpotList = [];

    if (highBloodPressureDataList == null || highBloodPressureDataList!.isEmpty ||
        lowBloodPressureDataList == null || lowBloodPressureDataList!.isEmpty) {
      // グラフデータが空の場合、エラーメッセージを表示するか、他の処理を行う
      return Scaffold(
        appBar: AppBar(
          title: const Text("グラフ"),
        ),
        body: const Center(
          child: Text("グラフデータがありません。"),
        ),
      );
    }

    for (int i = 0; i < highBloodPressureDataList!.length; i++) {
      double yValue = highBloodPressureDataList![i].toDouble();
      highflSpotList.add(FlSpot(i.toDouble(), yValue));
    }
    for (int i = 0; i < lowBloodPressureDataList!.length; i++) {
      double yValue = lowBloodPressureDataList![i].toDouble();
      lowflSpotList.add(FlSpot(i.toDouble(), yValue));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("グラフ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 32),
              height: 300,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: _titles,
                  borderData: FlBorderData(
                    show: true,
                    border:
                    Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  minX: 0,
                  maxX: highBloodPressureDataList!.length.toDouble() -1,
                  minY: 60,
                  maxY: 200,
                  lineBarsData: [
                    LineChartBarData(
                      spots: highflSpotList,
                      isCurved: true,
                      color: Colors.blue, // 高血圧用の色
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: lowflSpotList,
                      isCurved: true,
                      color: Colors.red, // 低血圧用の色
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  /*LineChart(
                LineChartData(
                    backgroundColor: Colors.grey[200],
                    titlesData: _titles,
                    minX: 0, // 最小のX軸値
                    maxX: highBloodPressureDataList!.length -
                        1.toDouble(), // 最大のX軸値
                    minY: 0, // 最小のY軸値
                    maxY: highBloodPressureDataList
                        ?.reduce((a, b) => a > b ? a : b)
                        .toDouble(), // 最大のY軸値
                    lineBarsData: [
                      LineChartBarData(
                          isCurved: true,
                          color: Colors.green[400],
                          barWidth: 4,
                          dotData: FlDotData(show: true),
                          spots: flSpotList),
                    ]),
              ),*/

  void _generateDataLists() {
    // ウィジェットのモデルリストを日付順にソート
    widget.modelList!.sort((a, b) => DateFormat('yyyy年M月d日')
        .parse(a.on_the_day_24)
        .compareTo(DateFormat('yyyy年M月d日').parse(b.on_the_day_24)));
    //highBloodPressureDataListの生成
    highBloodPressureDataList = widget.modelList!
        .where((model) => model.high_blood_pressure_12.isNotEmpty)
        .map((model) => double.tryParse(model.high_blood_pressure_12) ?? 0.0)
        .toList();

    //lowBloodPressureDataListの生成
    lowBloodPressureDataList = widget.modelList!
        .where((model) => model.low_blood_pressure_11.isNotEmpty)
        .map((model) => double.tryParse(model.low_blood_pressure_11) ?? 0.0)
        .toList();


    // xAxisLabelsの生成
    xAxisLabels = widget.modelList!
        .where((model) => model.high_blood_pressure_12.isNotEmpty)
        .map((model) => model.on_the_day_24)
        .toList();
  }
}
