import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Utils/Size_config.dart';
import 'package:flutter/material.dart';

class Pageveiwitem extends StatelessWidget {
  const Pageveiwitem({Key? key, this.image, this.title, this.subtitle})
      : super(key: key);

  final String? image;
  final String? title;
  final String? subtitle;
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: SizeConfig.defaultSize! * 18),
      Image.asset(image!),
      Text(
        title!,
        style: TextStyle(
            color: Color(0xff2f2e41),
            fontFamily: fontFamily,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      Text(
        subtitle!,
        style: TextStyle(
            color: Color(0xff78787c),
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
