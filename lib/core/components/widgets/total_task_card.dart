import 'package:flutter/material.dart';
import 'package:reminder_app/core/extension/context_extension.dart';

import '../../constants/colors.dart';

class TotalTaskCard extends StatelessWidget {
  int numberOfTask;
  String type;
  TotalTaskCard({
    required this.numberOfTask,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.taskCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            numberOfTask.toString(),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.getHeight * 0.02),
          Text(
            type,
            style: const TextStyle(
              fontSize: 18,
              color: MyColors.pendingTaskColor,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
