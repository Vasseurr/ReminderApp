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
  final _inputTitle = "".obs;
  final _inputDescription = "".obs;
  final _selectedDate = "".obs;
  final _datetime = DateTime.now().obs;
  final _isEditable = false.obs;

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
  set inputTitle(value) => _inputTitle.value = value;
  get inputTitle => _inputTitle.value;
  set inputDescription(value) => _inputDescription.value = value;
  get inputDescription => _inputDescription.value;
  set selectedDate(value) => _selectedDate.value = value;
  get selectedDate => _selectedDate.value;
  set datetime(value) => _datetime.value = value;
  get datetime => _datetime.value;
  set isEditable(value) => _isEditable.value = value;
  get isEditable => _isEditable.value;

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
