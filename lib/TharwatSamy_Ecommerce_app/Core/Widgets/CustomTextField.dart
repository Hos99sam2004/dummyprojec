import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {Key? key,
      required this.inPutType,
      this.suffixIcon,
      this.onChanged,
      this.onSaved,
      this.maxLines})
      : super(key: key);
  final TextInputType inPutType;
  final Widget? suffixIcon;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inPutType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xffcccccc)
        )
      ),
    )
    );
  }
}
