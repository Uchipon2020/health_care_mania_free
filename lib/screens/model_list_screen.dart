import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/model.dart';
import '../utils/database_helper.dart';
import 'model_detail_screen.dart';
import 'model_view_screen.dart';

class ModelListScreen extends StatefulWidget {
  const ModelListScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ModelListScreenState();
  }
}

class ModelListScreenState extends State<ModelListScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Model>? modelList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (modelList == null) {
      modelList = <Model>[];
      debugPrint('初期リセットビルド通過');
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTHCARE MANIA'),
      ),
      body: getModelListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Model(1,''), '新規登録');
        },
        tooltip: '新規登録',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getModelListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(modelList![position].priority),
              child: getPriorityIcon(modelList![position].priority),
            ),
            title: Text('受診日 : ${modelList![position].on_the_day_24}'),
            subtitle: Text('更新日${modelList![position].date}'),
            trailing: GestureDetector(
              child: IconButton(
                icon: const Icon(Icons.account_balance_wallet),
                color: Colors.grey,
                onPressed: () {
                  navigateToDetail(modelList![position], '訂正');
                },
              ),
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToView(modelList![position], '参照');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1: //type = "定期健康診断";
        return Colors.green;
      case 2: //type = "人間ドック";
        return Colors.blue;
      case 3:
        return Colors.yellow;
      default:
        return Colors.amber;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return const Icon(Icons.play_arrow);
      case 2:
        return const Icon(Icons.keyboard_double_arrow_right);
      case 3:
        return const Icon(Icons.keyboard_double_arrow_right);
      default:
        return const Icon(Icons.keyboard_double_arrow_right);
    }
  }

  void navigateToDetail(Model models, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ModelDetailScreen(
        model: models,
        appBarTitle: appBarTitle,
      );
    },),);

    if (result == true) {
      updateListView();
    }
  }

  void navigateToView(Model models, String appBarTitle) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ModelViewScreen(
            model: models,
            appBarTitle: appBarTitle,
          );
        },
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List> noteListFuture = databaseHelper.getModelList();
      noteListFuture.then((modelsList) {
        setState(() {
          this.modelList = modelsList.cast<Model>();
          count = modelsList.length;
        });
      });
    });
  }
}
