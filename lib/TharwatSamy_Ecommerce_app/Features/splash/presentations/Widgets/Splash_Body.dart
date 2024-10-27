import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Utils/Size_config.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Onbording/Presentation/On_bording_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashVeiwBody extends StatefulWidget {
  const SplashVeiwBody({Key? key}) : super(key: key);

  @override
  State<SplashVeiwBody> createState() => _SplashVeiwBodyState();
}

class _SplashVeiwBodyState extends State<SplashVeiwBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(animationController!);
    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150),
          FadeTransition(
            opacity: fadingAnimation!,
            child: Text(
              " Fruits Market ",
              style: TextStyle(
                fontFamily: GoogleFonts.allura().fontFamily,
                fontSize: 51,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
          ),
          ClipRRect(child: Image.asset("assets/images/splash_view_image.png")),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => OnBordingView(), transition: Transition.fade);
    });
  }
}
