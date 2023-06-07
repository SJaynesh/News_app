import 'package:exam_app/Controllers/BookMark_Provider.dart';
import 'package:exam_app/Model/BoockMark_Model.dart';
import 'package:exam_app/View.Screens/Homepage.dart';
import 'package:exam_app/View.Screens/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences Pref = await SharedPreferences.getInstance();

  List<String> BookMark = Pref.getStringList("BookMark") ?? [];
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                BookMark_Provider(m1: BookMark_Model(BookMark: BookMark))),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          "secondPage": (context) => SecondPage(),
        },
      ),
    ),
  );
}
