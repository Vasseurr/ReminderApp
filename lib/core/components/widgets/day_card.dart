import 'package:flutter/material.dart';
import 'package:reminder_app/core/extension/context_extension.dart';

import '../../constants/colors.dart';

class DayCard extends StatelessWidget {
  String dateNumber;
  String dayName;
  DayCard({
    required this.dateNumber,
    required this.dayName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight * 0.1,
      width: context.getWidth * 0.15,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20)),
          color: MyColors.taskCardColor),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          dateNumber,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          dayName,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ]),
    );
  }
}
