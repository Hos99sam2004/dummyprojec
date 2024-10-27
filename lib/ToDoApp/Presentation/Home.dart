import 'package:DummyProjects/ToDoApp/Presentation/Colors.dart';
import 'package:DummyProjects/ToDoApp/Presentation/Create.dart';
// import 'package:DummyProjects/ToDoApp/Presentation/Create.dart';
import 'package:DummyProjects/ToDoApp/Presentation/SeeAll.dart';
import 'package:DummyProjects/ToDoApp/Presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // ServicePRO().fetchDataPRO();
    Provider.of<ServicePRO>(context, listen: false).fetchDataPRO();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServicePRO>(context, listen: false);
    List MyData = Provider.of<ServicePRO>(context).MyData;
    return Scaffold(
      key: _key,
      backgroundColor: KBlackColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _key.currentState!.showBottomSheet(
            (context) => CreatePage(),
          );
        },
        child: Icon(
          Icons.add,
          color: KWhiteColor,
          size: 30,
        ),
        backgroundColor: KOrangeColor,
      ),
      appBar: AppBar(
          backgroundColor: KBlackColor,
          foregroundColor: KWhiteColor,
          centerTitle: true,
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(" Welcome Back !! ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text(" Hossam Nasr ",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ])),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: KOrangeColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                              DateFormat.yMMMMEEEEd().format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 18,
                              )))),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: KGrayColor,
                    ),
                    child: IconButton(
                        color: KWhiteColor,
                        onPressed: () {
                          setState(() {
                            prov.fetchDataPRO();
                          });
                        },
                        icon: Icon(Icons.refresh)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(" Today Tasks ",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 7, bottom: 12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: KOrangeColor,
                    ),
                    child: Text(
                      "${MyData.length}",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => Seeall());
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 7),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: KBlack2Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(" See All ",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      )),
                ],
              ),
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
}
