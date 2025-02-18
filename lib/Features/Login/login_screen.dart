

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Common Widgets/form_footer.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget  {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),

        bottom: PreferredSize(
            preferredSize:  Size.fromHeight(Get.height * 0.15),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: const AssetImage("assets/logos/emergencyAppLogo.png"), height: Get.height * 0.1),
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  const [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // (,
              LoginForm(),
              FooterWidget(Texts: "Não tenho uma conta ",Title: "Inscrever-se"),
            ],
          ),
        ),
      ),
    );
  }
}