
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healthcare_mania_legacy_new/screens/model_list_screen.dart';
//import 'package:flutter_stetho/flutter_stetho.dart';

void main() async {runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Health Care Mania',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber
        ),
        home: const ModelListScreen(),
        localizationsDelegates:const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ]
    );
  }
}