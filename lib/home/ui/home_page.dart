// ignore_for_file: prefer_const_constructors

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:reminder_app/core/components/widgets/task_card.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/core/init/lang/locale_keys.g.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

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
            locale: context.locale.toString() == "tr_TR" ? 'tr' : 'en_ISO',
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
        Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.04),
          child: Text(
            LocaleKeys.task_onGoing.tr() + " " + LocaleKeys.task_tasks.tr(),
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
          ),
        ),
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
                          LocaleKeys.hour_hourBeforeMidday.plural(9),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: context.height * 0.03),
                        Text(
                          LocaleKeys.hour_hourBeforeMidday.plural(10),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: context.height * 0.05),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: context.width * 0.05),
                        child: Column(
                          children: [
                            TaskCard(
                                title: "Mobile App Design",
                                description: "Mike and ana",
                                time: "09.15"),
                            SizedBox(height: context.height * 0.05),
                          ],
                        ),
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
}
