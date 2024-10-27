import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Utils/Size_config.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Widgets/CustomButtons.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Auth/Presentation/pages/Complete_information/Complete_Information_View.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginViewbody extends StatelessWidget {
  const LoginViewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 3),
        Padding(
          padding:
              const EdgeInsets.only(top: 40.0, left: 40, right: 40, bottom: 10),
          child: Image.asset(Klogo),
        ),
        Text(
          " Fruits Market ",
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 41,
            fontWeight: FontWeight.bold,
            color: KmainColor,
            letterSpacing: 3,
          ),
        ),
        Expanded(child: SizedBox()),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustombuttonsWithIcon(
                    color: Color(0xffdb3236),
                    icon: FontAwesomeIcons.googlePlusG,
                    text: "   Log in With ",
                    onTap: () {
                      Get.to(() => CompleteInformationView(),
                          transition: Transition.leftToRightWithFade,
                          duration: Duration(milliseconds: 500));
                    },
                  ),
                )),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustombuttonsWithIcon(
                    color: Color(0xff4267B2),
                    icon: FontAwesomeIcons.facebookF,
                    text: "  Log in With ",
                    onTap: () {
                      Get.to(() => CompleteInformationView(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500));
                    },
                  ),
                )),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
