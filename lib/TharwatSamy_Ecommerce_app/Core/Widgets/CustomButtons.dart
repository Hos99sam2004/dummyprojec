import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Utils/Size_config.dart';

import 'package:flutter/material.dart';

class Custombuttons extends StatelessWidget {
  const Custombuttons({Key? key, this.text}) : super(key: key);

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: KmainColor, borderRadius: BorderRadius.circular(13)),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily),
        ),
      ),
    );
  }
}

class CustombuttonsWithIcon extends StatelessWidget {
  const CustombuttonsWithIcon(
      {Key? key, this.icon, this.text, this.color, this.onTap})
      : super(key: key);
  final IconData? icon;
  final String? text;
  final Color? color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff707070), width: 2)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text!,
            style: TextStyle(
                fontFamily: fontFamily,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
