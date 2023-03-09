import 'package:get/get.dart';

import '../controllers/day_page_controller.dart';

class DayPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DayPageController>(
      () => DayPageController(),
    );
  }
}
