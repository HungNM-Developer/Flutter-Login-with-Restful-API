import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkRequest {
  static const String url = "http://a.vipn.net/api/device/init";

  saveData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(url), body: {"device_type": "2"});
    if (response.statusCode == 200) {
      final body = response.body;

      final res = jsonDecode(body);

      // ignore: avoid_print
      print(res);
      _prefs.setString("key", res.toString());
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  loadData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String data = _prefs.getString("key") ?? "No Data";
    // ignore: avoid_print
    print(data.toString());
  }

  clearData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    print("Data Cleared");
  }
}

// ignore: unnecessary_new
NetworkRequest networkRequest = new NetworkRequest();
