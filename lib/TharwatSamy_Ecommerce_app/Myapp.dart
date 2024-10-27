import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/splash/presentations/SplashVeiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FruitsMarket extends StatelessWidget {
  const FruitsMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashveiw(),
    );
  }
}
