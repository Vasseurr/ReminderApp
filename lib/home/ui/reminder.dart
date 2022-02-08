import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reminder_app/core/init/cache/hive_manager.dart';
import 'package:reminder_app/core/objects/reminder_card.dart';
import 'package:reminder_app/core/routes/app_routes.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

class ReminderList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<HomeController>(
      initState: (state) async {},
      builder: (controller) {
        return controller.isLoading == false
            ? _body(context)
            : const Center(child: CircularProgressIndicator());
      },
    ));
  }

  _appBar(BuildContext context) {
    Color buttonBlue = Colors.blue.shade600;
    return Container(
      height: context.height * 0.1,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                //openPopup();
                Get.toNamed(Routes.ADD_REMINDER);
              },
              icon: Icon(
                Icons.add,
                color: buttonBlue,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Text("Edit", style: TextStyle(color: buttonBlue)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(context),
          Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.03,
                left: context.width * 0.1,
                right: context.width * 0.1),
            child: const Text(
              "Widgetly",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          _content(context)
        ],
      ),
    );
  }

  _content(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: context.height * 0.03,
            left: context.width * 0.1,
            right: context.width * 0.1),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _box(context, index);
                    },
                    itemCount: HiveManager.instance.totalReminderObject())),
          ],
        ),
      ),
    );
  }

  Container _box(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.02),
      height: context.height * 0.12,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: context.width * 0.05,
              ),
              decoration: BoxDecoration(
                  color: controller.backgroundColor(index),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _infos(index),
                  const Spacer(),
                  _percentIndicator(index),
                ],
              ),
            ),
          ),
          SizedBox(width: context.width * 0.03),
          SizedBox(
            height: context.height * 0.05,
            width: context.width * 0.05,
            child: Switch(
              value: HiveManager.instance.getReminderObject(index).isActive!,
              onChanged: (value) async {
                controller.isLoading = true;
                ReminderCard card =
                    HiveManager.instance.getReminderObject(index);
                card.isActive = value;
                await HiveManager.instance.updateReminderObject(card, index);
                controller.isLoading = false;
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _percentIndicator(int index) {
    return Expanded(
      flex: 2,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 8.0,
            percent: 0.5,
            animation: true,
            animationDuration: 1000,
            backgroundColor: Colors.red.shade100,
            progressColor: controller.circleColor(index),
            circularStrokeCap: CircularStrokeCap.round,
            center: const Text(
              "0",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _infos(int index) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoText(
              HiveManager.instance.getReminderObject(index).title!, index),
          const SizedBox(height: 3),
          _infoText(HiveManager.instance.getReminderObject(index).description!,
              index),
          const SizedBox(height: 3),
          _infoText(HiveManager.instance.getReminderObject(index).date!, index),
        ],
      ),
    );
  }

  _infoText(String text, int index) => AutoSizeText(
        text,
        style: TextStyle(color: controller.textColor(index)),
        minFontSize: 16,
        maxLines: 1,
      );

  void openPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.close,
                      size: 24,
                    ),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text("Submit"), onPressed: () {}),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
