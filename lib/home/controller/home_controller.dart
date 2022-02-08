import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/core/init/cache/hive_manager.dart';
import 'package:reminder_app/core/models/reminder_card.dart';
import 'package:reminder_app/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository) : assert(_repository != null);

  final _isDarkMode = false.obs;
  final _isLoading = false.obs;
  final _backgroundCurrentColor = Colors.blue.shade400.obs;
  final _circleCurrentColor = Colors.black.obs;
  final _textCurrentColor = Colors.white.obs;
  final _pickerColor = Colors.white.obs;

  set isDarkMode(value) => _isDarkMode.value = value;
  get isDarkMode => _isDarkMode.value;
  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;
  set backgroundCurrentColor(value) => _backgroundCurrentColor.value = value;
  get backgroundCurrentColor => _backgroundCurrentColor.value;
  set circleCurrentColor(value) => _circleCurrentColor.value = value;
  get circleCurrentColor => _circleCurrentColor.value;
  set textCurrentColor(value) => _textCurrentColor.value = value;
  get textCurrentColor => _textCurrentColor.value;
  set pickerColor(value) => _pickerColor.value = value;
  get pickerColor => _pickerColor.value;

  initList() async {
    _isLoading.value = true;
    /*titleList = List.generate(4, (index) => 'Birthday');
    descriptionList = List.generate(4, (index) => 'Birthday Description');
    dateList = List.generate(4, (index) => '15 May 2019');*/
    await HiveManager.instance.addReminderObject(ReminderCard(
        title: "Birthday",
        description: "Birthday Description",
        date: "19 May 2015",
        backgroundColor: Colors.red.shade400.toString(),
        circleColor: Colors.blue.shade800.toString(),
        textColor: Colors.white.toString()));
    await HiveManager.instance.addReminderObject(ReminderCard(
        title: "Birthday",
        description: "Birthday Description",
        date: "19 May 2015",
        backgroundColor: Colors.amber.shade600.toString(),
        circleColor: Colors.red.shade900.toString(),
        textColor: Colors.white.toString()));
    await HiveManager.instance.addReminderObject(ReminderCard(
        title: "Birthday",
        description: "Birthday Description",
        date: "19 May 2015",
        backgroundColor: Colors.blue.shade300.toString(),
        circleColor: Colors.green.shade800.toString(),
        textColor: Colors.white.toString()));
    await HiveManager.instance.addReminderObject(ReminderCard(
        title: "Birthday",
        description: "Birthday Description",
        date: "19 May 2015",
        backgroundColor: Colors.green.shade300.toString(),
        circleColor: Colors.purple.shade700.toString(),
        textColor: Colors.white.toString()));
    _isLoading.value = false;
  }

  Color backgroundColor(int index) {
    return Color(int.parse(
        ((HiveManager.instance
            .getReminderObject(index)
            .backgroundColor!
            .split('(0x')[1]
            .split(')')[0])),
        radix: 16));
  }

  Color circleColor(int index) {
    return Color(int.parse(
        ((HiveManager.instance
            .getReminderObject(index)
            .circleColor!
            .split('(0x')[1]
            .split(')')[0])),
        radix: 16));
  }

  Color textColor(int index) {
    return Color(int.parse(
        ((HiveManager.instance
            .getReminderObject(index)
            .textColor!
            .split('(0x')[1]
            .split(')')[0])),
        radix: 16));
  }
}
