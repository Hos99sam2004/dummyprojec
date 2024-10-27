import 'package:DummyProjects/ToDoApp/Presentation/Colors.dart';
import 'package:DummyProjects/ToDoApp/Presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key? key, this.itemData}) : super(key: key);
  Map? itemData;

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    if (widget.itemData != null) {
      isEdit = true;
      titleController.text = widget.itemData!["title"];
      descriptionController.text = widget.itemData!["description"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServicePRO>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: KBlackColor,
          border: Border(
            top: BorderSide(color: KOrangeColor, width: 4),
          )),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task Title",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 15),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Task Description ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              maxLines: 3,
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: "  Type Description Here  ... ",
                  hintStyle: TextStyle(color: KGrayColor, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KOrangeColor),
                  ),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: KBlack2Color),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: KOrangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {
                    isEdit
                        ? prov.updata_Data(
                            context: context,
                            title: titleController.text,
                            des: descriptionController.text,
                            id1: widget.itemData!["_id"])
                        : prov.postData(
                            context: context,
                            des: descriptionController.text,
                            title: titleController.text);
                    setState(() {});
                  },
                  child: Text(isEdit ? " Update Task " : " Create Task ",
                      style: TextStyle(
                        color: KWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
