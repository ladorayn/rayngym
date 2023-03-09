import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/slot_page_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rayn/component/slot_card.dart';

final _firestore = FirebaseFirestore.instance;

class SlotPageView extends GetView<SlotPageController> {
  SlotPageView({Key? key}) : super(key: key);
  final SlotPageController slotC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${slotC.img}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // tambahkan baris ini
                  children: <Widget>[
                    Text(
                      slotC.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        decoration: TextDecoration.none,
                        fontSize: 24,
                      ),
                    ),
                    SlotStreams(
                      day: slotC.title.toLowerCase(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlotStreams extends StatelessWidget {
  final String day;

  const SlotStreams({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('schedule').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final schedules = snapshot.data?.docs;
        final List<SlotCard> slotCards = [];
        for (var slots in schedules!) {
          if (!slots.data().toString().contains(day.toLowerCase())) {
            continue;
          }
          final daySlot = slots[day.toLowerCase()];
          final slotList = daySlot['data'];
          for (var slot in slotList) {
            final numSlot = slot['num'];
            final hourSlot = slot['hour'];
            final users = slot['users'];

            final slotCard = SlotCard(
              users: users,
              numSlot: numSlot,
              hour: hourSlot,
            );
            slotCards.add(slotCard);
          }
          break;
        }
        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true, // tambahkan baris ini
          crossAxisCount: 2,
          children: slotCards,
        );
      },
    );
  }
}

// Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage('images/${slotC.img}.jpg'),
// fit: BoxFit.cover,
// ),
// ),
