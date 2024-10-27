import 'package:DummyProjects/ToDoApp/Presentation/Colors.dart';
import 'package:DummyProjects/ToDoApp/Presentation/provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:DummyProjects/ToDoApp/Presentation/Create.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Seeall extends StatefulWidget {
  const Seeall({Key? key}) : super(key: key);

  @override
  State<Seeall> createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  @override
  void initState() {
    Provider.of<ServicePRO>(context, listen: false).fetchDataPRO();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    final prov = Provider.of<ServicePRO>(context, listen: false);
    List MyData = Provider.of<ServicePRO>(context).allList;
    return Scaffold(
      backgroundColor: KBlackColor,
      key: _key,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreatePage());
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: KOrangeColor,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                prov.fetchDataPRO();
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
        backgroundColor: KOrangeColor,
        centerTitle: true,
        title: Text(" All Tasks "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 670,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: MyData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: KBlack2Color,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyData[index]['title'],
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: MyData[index]['is_completed']
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none)),
                            Text(
                              MyData[index]['description'],
                              style: TextStyle(fontSize: 18, color: KGrayColor),
                            ),
                            Row(
                              children: [
                                Text(
                                    DateFormat.yMMMEd().format(
                                      DateTime.parse(
                                          MyData[index]['created_at']),
                                    ),
                                    style: TextStyle(
                                        fontSize: 18, color: KGrayColor)),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    _key.currentState!.showBottomSheet(
                                      (context) => CreatePage(
                                        itemData: MyData[index],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                  color: KGreenColor,
                                  iconSize: 30,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        backgroundColor: KBlack2Color,
                                        content: Column(
                                          children: [
                                            Icon(Icons.warning,
                                                size: 40, color: KOrangeColor),
                                            Text(
                                              "Are you sure?",
                                              style: TextStyle(
                                                color: KOrangeColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        titleStyle: TextStyle(
                                          fontSize: 25,
                                        ),
                                        title: "Alert",
                                        actions: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: KRedColor,
                                            ),
                                            onPressed: () {
                                              prov.deleteById(
                                                  MyData[index]['_id']);
                                              navigator?.pop(context);
                                            },
                                            child: Text(
                                              " Yes ",
                                              style: TextStyle(
                                                color: KWhiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: KBlackColor,
                                            ),
                                            onPressed: () {
                                              navigator?.pop(context);
                                              Get.back();
                                            },
                                            child: Text(
                                              " no ",
                                              style: TextStyle(
                                                color: KWhiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ]);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                  color: KRedColor,
                                  iconSize: 30,
                                ),
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StarBorder(),
                                  side: BorderSide(color: KWhiteColor),
                                  activeColor: KOrangeColor,
                                  value: MyData[index]['is_completed'],
                                  onChanged: (val) => {
                                    setState(() {
                                      prov.check(
                                        id: MyData[index]['_id'],
                                        title: MyData[index]['title'],
                                        des: MyData[index]['description'],
                                        check: val!,
                                      );
                                    }),
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  check(bool check, String id, String title, String des) async {
    final body = {
      "is_completed": check,
      "title": title,
      "description": des,
    };
    var url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    print(response.statusCode);
    // fetchData();
  }

  deleteById(String id) async {
    var url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.delete(url);
    // fetchData();
  }
}
