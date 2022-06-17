import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reminder_app/core/components/buttons/custom_button.dart';
import 'package:reminder_app/core/components/text/text_form_field.dart';
import 'package:reminder_app/core/components/utils/utils.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/constants/repeat_type.dart';
import 'package:reminder_app/core/extension/time_extension.dart';
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
        backgroundColor: MyColors.backgroundColor,
        body: GetX<HomeController>(
          initState: (state) async {
            initializeDateFormatting();
            String formattedDate =
                DateFormat('dd MMMM yyyy', 'tr_TR').format(DateTime.now());
            controller.selectedDate = formattedDate;
          },
          didUpdateWidget: (oldWidget, state) {
            print("HEELLLL2");
            controller.timeOfDay = TimeOfDay.now();
          },
          builder: (controller) {
            print("HEELLLL3");
            return _body(context);
          },
        ));
  }

  _appBar(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      color: MyColors.backgroundColor,
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
                  padding: const EdgeInsets.all(4.0),
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
                  padding: const EdgeInsets.all(4.0),
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
      child: Center(
        child: Column(
          children: [
            // _appBar(context),
            SizedBox(height: context.height * 0.01),
            _box(context),
            SizedBox(height: context.height * 0.01),
            _inputFields(context),
          ],
        ),
      ),
    );
  }

  _save(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.height * 0.02),
        child: VasseurrBttn(
          buttonText: "Kaydet",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          width: context.width * 0.4,
          onPressed: () {
            //! Control title, description and date are not null
            //! Select date + select hour (ex. 9-10)
          },
          buttonColor: MyColors.saveReminderButtonColor,
          borderColor: MyColors.saveReminderButtonColor,
        ),
      ),
    );
  }

  _inputFields(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.height * 0.4,
        width: context.width * 0.8,
        padding: EdgeInsets.only(
            left: context.width * 0.05,
            right: context.width * 0.05,
            top: context.height * 0.02),
        margin: EdgeInsets.only(bottom: context.height * 0.01),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 6.0),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.2))),
                child: VasseurrTFF(
                  hintText: "Title",
                  //  borderWidth: 1.0,
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
                FocusScope.of(context).unfocus();
                openCalendar(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
                width: context.width * 0.8,
                /* height: controller.selectedDate.toString() == ""
                    ? context.height * 0.03
                    : context.height * 0.045,*/
                height: context.height * 0.045,
                child: Row(
                  children: [
                    _header("Date"),
                    const Spacer(),
                    Container(
                        padding: EdgeInsets.all(context.width * 0.02),
                        /*   decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(15)),*/
                        child: controller.selectedDate.toString() == ""
                            ? const SizedBox()
                            : _value(controller.selectedDate.toString())),
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                _selectTime(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
                width: context.width * 0.8,
                height: context.height * 0.045,
                child: Row(
                  children: [
                    _header("Hour"),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.01,
                          horizontal: context.width * 0.06),
                      /*    decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)),*/
                      child: _value(
                        controller.timeOfDayHour.toString() +
                            ":" +
                            controller.timeOfDayMinute.toString(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                _selectRepatType(context);
              },
              child: Container(
                width: context.width * 0.8,
                margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
                height: context.height * 0.045,
                child: Row(
                  children: [
                    _header("Repeat"),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.01,
                          horizontal: context.width * 0.06),
                      child: _value(controller.selectedRepatTypeIndex == 2
                          ? "Mon to Fri"
                          : RepeatType
                              .values[controller.selectedRepatTypeIndex].name
                              .toString()),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Flexible(child: _header("Vibrate when event time is up")),
                Switch(
                    value: controller.isVibrate,
                    onChanged: (value) {
                      controller.isVibrate = value;
                    }),
              ],
            ),
            _save(context),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _selectRepatType(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Obx(
            () => Container(
              height: context.height * 0.4,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                  top: context.height * 0.02,
                  bottom: context.height * 0.02,
                  left: context.width * 0.04,
                  right: context.width * 0.04,
                ),
                child: Column(
                  children: [
                    _repeatTypeButton(title: "Once", index: 0),
                    _repeatTypeButton(title: "Daily", index: 1),
                    _repeatTypeButton(title: "Mon to Fri", index: 2),
                    _repeatTypeButton(title: "Custom", index: 3),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextButton _repeatTypeButton({required String title, required int index}) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: controller.selectedRepatTypeIndex == index
              ? MyColors.pendingTaskColor
              : Colors.white),
      onPressed: () {
        controller.selectedRepatTypeIndex = index;
        Get.back();
      },
      child: ListTile(
        leading: _header(title),
        trailing: controller.selectedRepatTypeIndex == index
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              )
            : const SizedBox(),
      ),
    );
  }

  AutoSizeText _value(String value) {
    return AutoSizeText(
      value,
      maxLines: 1,
      maxFontSize: 15,
      style: const TextStyle(fontSize: 17),
    );
  }

  AutoSizeText _header(String header) => AutoSizeText(
        header,
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      );

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial,
        confirmText: "Onayla",
        cancelText: "İptal Et",
        helpText: "Saat Seç");

    if (timeOfDay != null && timeOfDay != controller.timeOfDay) {
      if (timeOfDay.compareTo(controller.timeOfDay) == -1) {
        //! Check date, ıf same day, check hour and minute
        Utils.instance
            .showSnackBar(context, content: "Geriye dönük oluşturulamaz");
        return;
      }
      print("tıme -> " + timeOfDay.hourOfPeriod.toString());
      controller.timeOfDay = timeOfDay;
    }
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
          color: MyColors.taskCardColor,
          borderRadius: BorderRadius.circular(15),
        ),
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
            percent: (controller.datetime.difference(DateTime.now())).inDays >=
                    365
                ? 1
                : (controller.datetime.difference(DateTime.now())).inDays / 365,

            //0.5,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _infoText(
                controller.inputTitle == "" ? "Title" : controller.inputTitle),
            //  const SizedBox(height: 8),
            _infoText(controller.inputDescription == ""
                ? "Description"
                : controller.inputDescription),
            // const SizedBox(height: 8),
            _infoText(controller.selectedDate == ""
                ? "Date"
                : controller.selectedDate),
          ],
        ),
      ),
    );
  }

  Text _infoText(String text) => Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: controller.textCurrentColor, fontSize: 16),
      );

  openCalendar(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 1, 1), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
      String formattedDate = DateFormat('dd MMMM yyyy', 'tr_TR').format(date);
      controller.datetime = date;
      controller.selectedDate = formattedDate;
    }, currentTime: controller.datetime, locale: LocaleType.tr);
  }
}
