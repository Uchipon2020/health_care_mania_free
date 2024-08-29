
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/model.dart';

class WeightGraph extends StatefulWidget {
  List<Model>? modelList;
  WeightGraph({required this.modelList, Key? key}) : super(key: key);

  @override
  State<WeightGraph> createState() => _WeightGraphState();
}

class _WeightGraphState extends State<WeightGraph> {
  List<double>? weightDataList;
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
            "Your Weight Data",
            style: _titleStyle,
          ),
          axisNameSize: 48),
      rightTitles: const AxisTitles(
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
                  color: Colors.black, // ラベルのテキスト色を指定
                  fontSize: 12, // ラベルのフォントサイズを指定
                ),
              ); // X軸のラベル // Y軸のラベルを整数にフォーマット
            },
          ),
          axisNameWidget: Text(
            "Weight(kg)",
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
    for (int i = 0; i < weightDataList!.length; i++) {
      String dateStr = widget.modelList![i].on_the_day_24; // 'date' フィールドから日付文字列を取得
      DateTime originalData = DateFormat('yyyy年M月d日').parse(dateStr);
      String formattedDatSter = DateFormat('yyyy.MM.dd').format(originalData);
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
    if (weightDataList == null || weightDataList!.isEmpty) {
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
    List<FlSpot> flSpotList = [];
    for (int i = 0; i < weightDataList!.length; i++) {
      double yValue = weightDataList![i].toDouble();
      flSpotList.add(FlSpot(i.toDouble(), yValue));
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
              child: LineChart(LineChartData(
                  backgroundColor: Colors.grey[200],
                  titlesData: _titles,
                  minX: 0, // 最小のX軸値
                  maxX: weightDataList!.length - 1.toDouble(), // 最大のX軸値
                  minY: 0, // 最小のY軸値
                  maxY: weightDataList
                      ?.reduce((a, b) => a > b ? a : b)
                      .toDouble(), // 最大のY軸値
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.green[400],
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                      spots: flSpotList,
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }

  void _generateDataLists() {
    // weightDataListの生成
    weightDataList = widget.modelList!
        .where((model) => model.weight_2.isNotEmpty)
        .map((model) => double.tryParse(model.weight_2) ?? 0.0)
        .toList();

    // xAxisLabelsの生成
    xAxisLabels = widget.modelList!
        .where((model) => model.weight_2.isNotEmpty)
        .map((model) => model.on_the_day_24)
        .toList();
  }
}
