import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCurrency {
  Future<dynamic> getApiData() async {
    print("there");
    String url = "https://api.exchangeratesapi.io/latest";
    var response = await http.get(url);
    var data = json.decode(response.body)["rates"];
    // print()
    return data;
    // Map<Strse = await http.get(url);.geting, String> userdata = jsonDecode(data["rates"]);
    // return userdata;print
  }
}
