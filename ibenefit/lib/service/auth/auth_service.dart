import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static const String url = "http://a.vipn.net/api/auth";
  // final httpClient = http.Client();
  Map<String, String> customHeaders = {
    "DEVICE-CODE": "4b74a25b01e5b5a692bd5ada675fc780"
  };

  Future Login(Map<String, String> body) async {
    //SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse(url + "/login"),
      headers: customHeaders,
      body: body,
    );
    if (response.statusCode == 200) {
      final body = response.body;

      final res = jsonDecode(body);

      // ignore: avoid_print
      //_prefs.setString("key", res.toString());
      return res;

      //_prefs.setString("key", res.toString());
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
    return response.body;
  }

  Future Logout() async {
    var response =
        await http.get(Uri.parse(url + "/logout"), headers: customHeaders);
    if (response.statusCode == 200) {
      final body = response.body;

      final res = jsonDecode(body);

      // ignore: avoid_print
      return res;

      //_prefs.setString("key", res.toString());
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
    return response.body;
  }
}
