import 'package:converter/components/bodyhome.dart';
import 'package:converter/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getDate() {
    var dt = DateTime.now();
    var newFormat = DateFormat("dd/MM/y H:m");
    String updatedDt = newFormat.format(dt);
    return updatedDt;
  }

  String datetime = "";
  @override
  void initState() {
    super.initState();
    datetime = getDate().toString();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Euro"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("last refresh $datetime", style: TextStyle(fontSize: 14))
                ],
              )
            ],
          ),
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              setState(() {
                datetime = getDate().toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
              });
            },
            child: Text("Refresh"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(width * 0.09),
                  right: Radius.circular(width * 0.09)),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
