import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ServicePRO with ChangeNotifier {
  List MyData = [];
  List allList = [];
  var url = Uri.parse("https://api.nstack.in/v1/todos");

  /// get
  Future<void> fetchDataPRO() async {
    var response = await http.get(url, headers: {"accept": "application/json"});
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      MyData = json['items'];
      final filterList = MyData.where(
        (element) => (DateFormat.yMMMEd()
                .format(DateTime.parse(element['created_at'])) ==
            DateFormat.yMMMEd().format(DateTime.now())),
      ).toList();

      MyData = filterList;

      allList = json['items'];
      notifyListeners();
      print("Accept");
    }
  }

  /// Post
  Future<void> postData(
      {required String title,
      required String des,
      required BuildContext context}) async {
    final body = {"title": title, "description": des, "is_completed": false};
    var url = Uri.parse("https://api.nstack.in/v1/todos");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    if (response.statusCode == 201) {
      Get.snackbar("Success", "Task Created Successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      Navigator.pop(context);
      fetchDataPRO();
    } else {
      Get.snackbar("Error", "Task Creation Failed",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  /// update
  updata_Data(
      {required String title,
      required String des,
      required String id1,
      required BuildContext context}) async {
    final id = id1;
    final body = {"title": title, "description": des, "is_completed": false};
    var url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar("Success", "Updated",
          backgroundColor: Colors.green, colorText: Colors.white);
      Navigator.pop(context);
      fetchDataPRO();
    } else {
      Get.snackbar("Error", "Something Error",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  /// Check
  check(
      {required bool check,
      required String id,
      required String des,
      required String title}) async {
    final body = {"is_completed": check, "title": title, "description": des};
    var url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    print(response.statusCode);
    fetchDataPRO();
  }

  /// delete

  deleteById(String id) async {
    var url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.delete(url);
    fetchDataPRO();
  }
}
