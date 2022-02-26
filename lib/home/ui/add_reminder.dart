import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reminder_app/core/components/buttons/custom_button.dart';
import 'package:reminder_app/core/components/text/text_form_field.dart';
import 'package:reminder_app/core/init/cache/hive_manager.dart';
import 'package:reminder_app/core/models/reminder_card.dart';
import 'package:reminder_app/core/routes/app_routes.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

class AddReminder extends GetView<HomeController> {
  const AddReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey.shade200,
        body: GetX<HomeController>(
          initState: (state) async {},
          builder: (controller) {
            return _body(context);
          },
        ));
  }

  _appBar(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  //openPopup();
                  Get.back();
                },
                icon: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                )),
            IconButton(
                onPressed: () async {
                  //openPopup();
                  await HiveManager.instance.addReminderObject(ReminderCard(
                      title: controller.inputTitle,
                      description: controller.inputDescription,
                      date: controller.datetime,
                      backgroundColor:
                          controller.backgroundCurrentColor.toString(),
                      circleColor: controller.circleCurrentColor.toString(),
                      textColor: controller.textCurrentColor.toString()));
                  controller.inputTitle = "";
                  controller.inputDescription = "";
                  controller.selectedDate = "";
                  Get.offAndToNamed(Routes.REMINDER_LIST);
                },
                icon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue.shade800),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBar(context),
            SizedBox(height: context.height * 0.05),
            _box(context),
            SizedBox(height: context.height * 0.02),
            _inputFields(context),
            SizedBox(height: context.height * 0.05),
            _colors(context),
          ],
        ),
      ),
    );
  }

  Container _colors(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.1),
      width: context.width * 0.8,
      padding: EdgeInsets.only(
          left: context.width * 0.05, right: context.width * 0.05),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: context.width * 0.8,
              padding: const EdgeInsets.only(bottom: 6.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Background color"), _color(1, context)],
              )),
          Container(
              width: context.width * 0.8,
              padding: const EdgeInsets.only(bottom: 6.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Circle"), _color(2, context)],
              )),
          SizedBox(
              width: context.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Text color"),
                  _color(3, context),
                ],
              )),
        ],
      ),
    );
  }

  _color(int type, BuildContext context) {
    return InkWell(
      onTap: () {
        _colorPickerPopup(type, context);
      },
      child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: type == 1
                  ? controller.backgroundCurrentColor == Colors.white
                      ? Colors.black
                      : controller.backgroundCurrentColor
                  : type == 2
                      ? controller.circleCurrentColor == Colors.white
                          ? Colors.black
                          : controller.circleCurrentColor
                      : controller.textCurrentColor == Colors.white
                          ? Colors.black
                          : controller.textCurrentColor,
              shape: BoxShape.circle),
          child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: type == 1
                      ? controller.backgroundCurrentColor
                      : type == 2
                          ? controller.circleCurrentColor
                          : controller.textCurrentColor,
                  shape: BoxShape.circle),
              child: const Text(" "))),
    );
  }

  Container _inputFields(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.1),
      width: context.width * 0.8,
      padding: EdgeInsets.only(
          left: context.width * 0.05, right: context.width * 0.05),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: context.height * 0.03,
              width: context.width * 0.8,
              padding: const EdgeInsets.only(bottom: 6.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: VasseurrTFF(
                hintText: "Title",
                borderWidth: 1.0,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                fillColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.black,
                textColor: Colors.black,
                // onSaved: (value) => controller.inputTitle,
                onChanged: (value) => controller.inputTitle = value,
              )),
          Container(
              height: context.height * 0.03,
              width: context.width * 0.8,
              padding: const EdgeInsets.only(bottom: 6.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: VasseurrTFF(
                hintText: "Description",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                fillColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.black,
                textColor: Colors.black,
                onChanged: (value) => controller.inputDescription = value,
              )),
          InkWell(
            onTap: () {
              openCalendar(context);
            },
            child: SizedBox(
                width: context.width * 0.8,
                height: controller.selectedDate.toString() == ""
                    ? context.height * 0.03
                    : context.height * 0.045,
                child: Row(
                  children: [
                    const Text("Select a date"),
                    const Spacer(),
                    controller.selectedDate.toString() == ""
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.all(context.width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(controller.selectedDate.toString())),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Container _box(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.02),
      height: context.height * 0.15,
      width: context.width * 0.8,
      child: Container(
        padding: EdgeInsets.only(
          left: context.width * 0.05,
        ),
        decoration: BoxDecoration(
            color: controller.backgroundCurrentColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _infos(),
            _percentIndicator(),
          ],
        ),
      ),
    );
  }

  Expanded _percentIndicator() {
    return Expanded(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 10.0,
            percent: 0.5,
            animation: true,
            animationDuration: 1000,
            backgroundColor: Colors.red.shade100,
            progressColor: controller.circleCurrentColor,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              controller.selectedDate == ""
                  ? "0"
                  : (controller.datetime.difference(DateTime.now()))
                      .inDays
                      .toString(),
              /* .difference()
                      .inDays
                      .toString(),*/
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _infos() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoText(
              controller.inputTitle == "" ? "Title" : controller.inputTitle),
          const SizedBox(height: 8),
          _infoText(controller.inputDescription == ""
              ? "Description"
              : controller.inputDescription),
          const SizedBox(height: 8),
          _infoText(
              controller.selectedDate == "" ? "Date" : controller.selectedDate),
        ],
      ),
    );
  }

  Text _infoText(String text) => Text(
        text,
        style: TextStyle(color: controller.textCurrentColor, fontSize: 16),
      );

  _colorPickerPopup(int type, BuildContext context) {
    Color pickerColor = type == 1
        ? controller.backgroundCurrentColor
        : type == 2
            ? controller.circleCurrentColor
            : controller.textCurrentColor;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, innerSetState) {
            return AlertDialog(
              title: const Text("Pick a color"),
              content: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (value) {
                  pickerColor = value;
                },
              ),
              actions: [
                VasseurrBttn(
                    buttonText: "Got it",
                    onPressed: () {
                      switch (type) {
                        case 1:
                          controller.backgroundCurrentColor = pickerColor;
                          break;
                        case 2:
                          controller.circleCurrentColor = pickerColor;
                          break;
                        case 3:
                          controller.textCurrentColor = pickerColor;
                          break;
                      }
                      Get.back();
                    })
              ],
            );
          },
        );
      },
    );
  }

  openCalendar(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 1, 1), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
      String formattedDate = DateFormat('MMMM dd, yyyy').format(date);
      controller.datetime = date;
      controller.selectedDate = formattedDate;
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
