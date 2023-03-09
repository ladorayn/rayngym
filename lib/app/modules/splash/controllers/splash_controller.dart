import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(
        Routes.HOME,
      ),
    );
  }
}
