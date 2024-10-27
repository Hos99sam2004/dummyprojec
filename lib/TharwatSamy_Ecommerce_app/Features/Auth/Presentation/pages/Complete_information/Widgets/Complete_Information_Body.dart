import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Core/Widgets/CustomButtons.dart';
import 'package:DummyProjects/TharwatSamy_Ecommerce_app/Features/Auth/Presentation/pages/Complete_information/Widgets/Complete%20informationsitems.dart';
import 'package:flutter/material.dart';

class CompleteInformationBody extends StatelessWidget {
  const CompleteInformationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              CompleteInfoItems(
                text: " Enter YourName",
                inPutType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CompleteInfoItems(
                text: " Enter Your Phone Number",
                inPutType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CompleteInfoItems(
                text: " Enter Your Address",
                inPutType: TextInputType.phone,
                maxLines: 5,
              ),
              SizedBox(height: 40),
              Custombuttons(
                text: "Log in",
              )
            ],
          ),
        ),
      ),
    );
  }
}
