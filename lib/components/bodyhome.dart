import 'package:converter/utils/api.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _controllervalue = TextEditingController();
  int val = 1;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.09, vertical: width * 0.05),
            child: Center(
              child: TextField(
                controller: _controllervalue,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // gapPadding: width * 0.1,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                val = int.parse(_controllervalue.text);
              });
              print(val);
            },
            child: Text("Convert"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(width * 0.09),
                  right: Radius.circular(width * 0.09)),
            ),
          ),
          FutureBuilder(
            future: ApiCurrency().getApiData(),
            builder: (context, snapshot) {
              Map dataval = snapshot.data;
              // print(dataval.length);
              return dataval == null
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: dataval.length,
                        itemBuilder: (context, index) {
                          // print(snapshot.data.length);
                          double curr =
                              dataval.values.toList()[index] * val.toDouble();
                          String beforeval = "$curr".split(".")[0];
                          String afterval = "$curr".split(".")[1];
                          return Padding(
                            padding: EdgeInsets.all(width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataval.keys.toList()[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: width * 0.09,
                                    child: Text(
                                      "   :",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Text(
                                  beforeval +
                                      "." +
                                      "${afterval.length <= 3 ? afterval : afterval.substring(0, 3)}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
