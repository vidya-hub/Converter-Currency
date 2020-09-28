import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Getdata extends ChangeNotifier {
  // var dt = DateTime.now();
  var datetime = DateFormat("dd/MM/y H:m").format(DateTime.now());

  getDate() {
    datetime = DateFormat("dd/MM/y H:m").format(DateTime.now());
    notifyListeners();
  }
}
