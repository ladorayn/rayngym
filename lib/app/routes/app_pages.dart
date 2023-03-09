import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../modules/day_page/bindings/day_page_binding.dart';
import '../modules/day_page/views/day_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/slot_page/bindings/slot_page_binding.dart';
import '../modules/slot_page/views/slot_page_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DAY_PAGE,
      page: () => const DayPageView(),
      binding: DayPageBinding(),
    ),
    GetPage(
      name: _Paths.SLOT_PAGE,
      page: () => SlotPageView(),
      binding: SlotPageBinding(),
    ),
  ];
}
