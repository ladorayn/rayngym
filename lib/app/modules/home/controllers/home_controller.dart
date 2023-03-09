import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final List<String> imgSliderList = [
    'images/carousel1.jpeg',
    'images/carousel2.jpeg',
    'images/carousel3.jpeg',
  ].obs;
  final counterSlider = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setIndex(int index) {
    counterSlider.value = index;
  }

  // void increment() => count.value++;
}
