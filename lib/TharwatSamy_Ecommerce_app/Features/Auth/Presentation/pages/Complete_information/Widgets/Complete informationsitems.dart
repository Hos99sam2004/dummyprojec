import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class CompleteInfoItems extends StatelessWidget {
  const CompleteInfoItems({Key? key, required this.text, this.inPutType, this.maxLines})
      : super(key: key);
  final String text;
  final TextInputType? inPutType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Customtextfield(inPutType: inPutType!, maxLines:maxLines ),
      ],
    );
  }
}
