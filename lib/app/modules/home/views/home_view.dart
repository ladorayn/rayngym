import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeC = Get.find();
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = homeC.imgSliderList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      // Positioned(
                      //   bottom: 0.0,
                      //   left: 0.0,
                      //   right: 0.0,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //       gradient: LinearGradient(
                      //         colors: [
                      //           Color.fromARGB(200, 0, 0, 0),
                      //           Color.fromARGB(0, 0, 0, 0)
                      //         ],
                      //         begin: Alignment.bottomCenter,
                      //         end: Alignment.topCenter,
                      //       ),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10.0, horizontal: 20.0),
                      //   ),
                      // ),
                    ],
                  )),
            ))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: const Color(0xff181818),
              child: SafeArea(
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
                      height: 50,
                    ),
                    CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 1.3,
                          onPageChanged: (index, reason) {
                            homeC.setIndex(index);
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          homeC.imgSliderList.asMap().entries.map((entry) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          homeC.counterSlider.value == entry.key
                                              ? 0.9
                                              : 0.4)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 50,
                    ),
                    const Text(
                      'Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffD9D9D9),
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/book.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              margin: const EdgeInsets.all(10),
                              elevation: 20,
                              color: const Color(0xff232323),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 100,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'It’s a great day to start working out',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.DAY_PAGE);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffD9D9D9),
                                          minimumSize: const Size(150, 30),
                                        ),
                                        child: const Text(
                                          'See Available Slot',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
