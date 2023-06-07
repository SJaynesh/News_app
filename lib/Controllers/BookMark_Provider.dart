import 'package:exam_app/Model/BoockMark_Model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMark_Provider extends ChangeNotifier {

  BookMark_Model m1;

  BookMark_Provider({required this.m1});

  void BoockMark(String title) async{
    m1.BookMark.add(title);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setStringList("BookMark", m1.BookMark);
    notifyListeners();
  }

  void RemoveBookmark(int i) async{
    m1.BookMark.removeAt(i);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setStringList("BookMark", m1.BookMark);
    notifyListeners();
  }
}