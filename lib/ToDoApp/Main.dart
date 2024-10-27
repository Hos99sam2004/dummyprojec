import 'package:DummyProjects/ToDoApp/Presentation/Colors.dart';
import 'package:DummyProjects/ToDoApp/Presentation/Home.dart';
import 'package:DummyProjects/ToDoApp/Presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

class TODOAPP extends StatelessWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServicePRO(),
      child: GetMaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: KWhiteColor,              
            )),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
