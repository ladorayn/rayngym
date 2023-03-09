import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => const SizedBox(
          width: double.infinity,
          child: Center(
            child: Image(
              image: AssetImage("images/houseofedgelogo.jpeg"),
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
