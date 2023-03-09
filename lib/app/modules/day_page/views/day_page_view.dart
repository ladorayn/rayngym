import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/day_page_controller.dart';

import 'package:rayn/component/schedule_card.dart';

import '../../../routes/app_pages.dart';

class DayPageView extends GetView<DayPageController> {
  const DayPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff181818),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Color(0xff181818),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              color: const Color(0xff181818),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rayn Gym',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                      decoration: TextDecoration.none,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Your Favorite Private Gym',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xffADADAD),
                      decoration: TextDecoration.none,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  ScheduleCard(
                    label: 'MONDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Monday',
                          'img': 'monday',
                        },
                      );
                    },
                    img: 'monday',
                  ),
                  ScheduleCard(
                    label: 'TUESDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Tuesday',
                          'img': 'tuesday',
                        },
                      );
                    },
                    img: 'tuesday',
                  ),
                  ScheduleCard(
                    label: 'WEDNESDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Wednesday',
                          'img': 'wednesday',
                        },
                      );
                    },
                    img: 'wednesday',
                  ),
                  ScheduleCard(
                    label: 'THURSDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Thursday',
                          'img': 'thursday',
                        },
                      );
                    },
                    img: 'thursday',
                  ),
                  ScheduleCard(
                    label: 'FRIDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Friday',
                          'img': 'friday',
                        },
                      );
                    },
                    img: 'friday',
                  ),
                  ScheduleCard(
                    label: 'SATURDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Saturday',
                          'img': 'saturday',
                        },
                      );
                    },
                    img: 'saturday',
                  ),
                  ScheduleCard(
                    label: 'SUNDAY',
                    onPressed: () {
                      Get.toNamed(
                        Routes.SLOT_PAGE,
                        arguments: {
                          'title': 'Sunday',
                          'img': 'sunday',
                        },
                      );
                    },
                    img: 'sunday',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
