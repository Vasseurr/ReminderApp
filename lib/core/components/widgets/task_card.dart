import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TaskCard extends StatelessWidget {
  String title;
  String description;
  String time;
  TaskCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: MyColors.taskCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 17,
                    color: MyColors.pendingTaskColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  time,
                  style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.pendingTaskColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
