// ignore_for_file: prefer_const_constructors

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/core/components/widgets/task_card.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

import '../../core/components/widgets/day_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getWidth * 0.06,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  _month(context),
          // _days(context),
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 1, 1, 1),
            lastDate: DateTime(DateTime.now().year + 4, 1, 1),
            onDateSelected: (date) => print(date),
            leftMargin: context.getWidth * 0.1,
            monthColor: Colors.white,
            dayColor: MyColors.taskCardColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyColors.pendingTaskColor,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          _content(context),
        ],
      ),
    );
  }

  Column _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ongoing",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: context.height * 0.04),
        SizedBox(
            height: context.getHeight * 0.45,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "9 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: context.height * 0.03),
                        Text(
                          "10 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: context.height * 0.05),
                      ],
                    ),
                    SizedBox(width: context.width * 0.05),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.1,
                            child: TaskCard(
                                title: "Mobile App Design",
                                description: "Mike and ana",
                                time: "09.00 - 10.00"),
                          ),
                          SizedBox(height: context.height * 0.05),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 3,
              shrinkWrap: true,
            ))
      ],
    );
  }

  Row _days(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DayCard(
          dateNumber: "12",
          dayName: "Wed",
        ),
        DayCard(
          dateNumber: "13",
          dayName: "Thu",
        ),
        DayCard(
          dateNumber: "14",
          dayName: "Fri",
        ),
        DayCard(
          dateNumber: "15",
          dayName: "Sat",
        ),
      ],
    );
  }

  _month(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Text(
                "Mar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        )),
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              "April",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "May",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        )),
      ],
    );
  }
}
