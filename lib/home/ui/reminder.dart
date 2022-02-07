import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reminder_app/core/routes/app_routes.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

class ReminderList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
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
              itemCount: 4,
            )),
          ],
        ),
      ),
    );
  }

  Container _box(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.02),
      height: context.height * 0.12,
      child: Container(
        padding: EdgeInsets.only(
          left: context.width * 0.05,
        ),
        decoration: BoxDecoration(
            color: index == 0
                ? Colors.red.shade400
                : index == 1
                    ? Colors.amber.shade600
                    : index == 2
                        ? Colors.blue.shade300
                        : Colors.green.shade300,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _infos(),
            const Spacer(),
            _percentIndicator(index),
          ],
        ),
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
            progressColor: index == 0
                ? Colors.blue.shade800
                : index == 1
                    ? Colors.red.shade900
                    : index == 2
                        ? Colors.green.shade800
                        : Colors.purple.shade700,
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

  Expanded _infos() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoText("Birthday"),
          const SizedBox(height: 3),
          _infoText("Birthday Description"),
          const SizedBox(height: 3),
          _infoText("15 May 2019"),
        ],
      ),
    );
  }

  _infoText(String text) => AutoSizeText(
        text,
        style: const TextStyle(color: Colors.white),
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
