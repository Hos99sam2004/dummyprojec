import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/splash/presentations/Widgets/Splash_Body.dart';
import 'package:flutter/material.dart';

class Splashveiw extends StatelessWidget {
  const Splashveiw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///backgroundColor: Colors.tealAccent[400],
      backgroundColor: KmainColor,
      body: SplashVeiwBody(),
    );
  }
}
