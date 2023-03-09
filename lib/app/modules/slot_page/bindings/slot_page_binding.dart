import 'package:get/get.dart';

import '../controllers/slot_page_controller.dart';

class SlotPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlotPageController>(
      () => SlotPageController(),
    );
  }
}
