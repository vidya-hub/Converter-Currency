import 'package:converter/components/bodyhome.dart';
import 'package:converter/main.dart';
import 'package:converter/utils/utilsclass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
                  Consumer<Getdata>(
                    builder: (BuildContext context, value, Widget child) {
                      // String data = value.;
                      return Text("last refresh ${value.datetime}",
                          style: TextStyle(fontSize: 14));
                    },
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              Provider.of<Getdata>(context, listen: false).getDate();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ),
              );
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
