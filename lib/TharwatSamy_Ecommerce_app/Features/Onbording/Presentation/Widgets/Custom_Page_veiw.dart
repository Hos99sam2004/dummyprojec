// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Onbording/Presentation/Widgets/pageveiwItem.dart';

class CustomPageVeiw extends StatelessWidget {
  const CustomPageVeiw({
    Key? key, @required this.pageController}) : super(key: key);
final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
      Pageveiwitem(
        image: "assets/images/onboarding1.png",
        title: "E Shopping",
        subtitle: " Explore top oreganic fruits && Grap them",
      ),
      Pageveiwitem(
        image: "assets/images/onboarding2.png",
        title: "Delivery on the Way",
        subtitle: " Get your order by Speed Delivery",
      ),
      Pageveiwitem(
        image: "assets/images/onboarding3.png",
        title: "Delivary Arrived",
        subtitle: "Order Delivered Successfully",
      ),
    ]);
  }
}
