import 'package:converter/screens/homescreen.dart';
import 'package:converter/utils/utilsclass.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Getdata>(
      create: (context) {
        return Getdata();
      },
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
