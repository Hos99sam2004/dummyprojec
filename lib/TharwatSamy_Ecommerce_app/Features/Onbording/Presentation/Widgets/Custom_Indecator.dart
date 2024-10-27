// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({
    Key? key, @required this.dotindex}) : super(key: key);
  final int? dotindex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotindex! as int,
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: KmainColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: KmainColor),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
