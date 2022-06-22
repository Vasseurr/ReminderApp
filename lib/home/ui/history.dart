import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reminder_app/core/components/widgets/task_card.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

class History extends GetView<HomeController> {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _body(context));
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _dataCountType(context,
                  title: "10",
                  index: 0,
                  onpressed: () => controller.selectedDataCountIndex = 0),
              _dataCountType(context,
                  title: "20",
                  index: 1,
                  onpressed: () => controller.selectedDataCountIndex = 1),
              _dataCountType(context,
                  title: "30",
                  index: 2,
                  onpressed: () => controller.selectedDataCountIndex = 2),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.getHeight * 0.02),
                  child: TaskCard(
                    title: "Flutter",
                    description: "Flutter app dev",
                    time: index > 0
                        ? "22/06/2022 ${index + 9}.00"
                        : "22/06/2022 0${index + 9}.00",
                  ),
                );
              },
              itemCount: controller.selectedDataCountIndex == 0
                  ? 10
                  : controller.selectedDataCountIndex == 1
                      ? 20
                      : 30,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  _dataCountType(BuildContext context,
      {required String title,
      required int index,
      required Function() onpressed}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: index == controller.selectedDataCountIndex
              ? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100, width: 1),
        ),
        child: TextButton(
          onPressed: onpressed,
          child: Text(
            title,
            style: context.textTheme.headline6!.copyWith(
                color: index == controller.selectedDataCountIndex
                    ? MyColors.taskCardColor
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
