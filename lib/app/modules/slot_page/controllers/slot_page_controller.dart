import 'package:get/get.dart';

class SlotPageController extends GetxController {
  Map<String, String> argumentData = Get.arguments;

  late final String title;
  late final String img;

  @override
  void onInit() {
    title = argumentData['title'].toString();
    img = argumentData['img'].toString();
    super.onInit();
  }
}
