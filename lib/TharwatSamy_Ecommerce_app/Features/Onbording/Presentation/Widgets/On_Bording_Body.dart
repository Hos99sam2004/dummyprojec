import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Constants.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Utils/Size_config.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Widgets/CustomButtons.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Auth/Presentation/pages/Login/LoginVeiw.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Onbording/Presentation/Widgets/Custom_Indecator.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Onbording/Presentation/Widgets/Custom_Page_veiw.dart';
// import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/splash/presentations/SplashVeiw.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OnBordingBody extends StatefulWidget {
  OnBordingBody({Key? key}) : super(key: key);

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {
  PageController? pageController = PageController();
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageVeiw(pageController: pageController),
        Positioned(
          bottom: SizeConfig.defaultSize! * 17,
          left: 0,
          right: 0,
          child: CustomIndecator(
            dotindex:
                pageController!.hasClients ? pageController!.page!.round() : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 35,
            child: Text(
              " Skip ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontFamily),
            ),
          ),
        ),
        Positioned(
            bottom: SizeConfig.defaultSize! * 10,
            left: SizeConfig.defaultSize! * 10,
            right: SizeConfig.defaultSize! * 10,
            child: InkWell(
              onTap: () {
             if(pageController!.page! < 2){
               pageController!.nextPage(
                   duration: Duration(milliseconds: 500), curve: Curves.ease);
             }else{
               Get.to(()=> Loginveiw(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 500));
             }
              },
              child: Custombuttons(
                text: pageController!.hasClients
                    ? (pageController?.page == 2 ? " Get Started " : " Next ")
                    : "Next",
              ),
            )),
      ],
    );
  }
}
