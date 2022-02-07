import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/core/constants/hive_keys.dart';
import 'package:reminder_app/core/init/cache/hive_manager.dart';
import 'package:reminder_app/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository) : assert(_repository != null);

  final RxString _userName = "".obs;
  final _isLoading = false.obs;
  final _backgroundCurrentColor = Colors.blue.shade400.obs;
  final _circleCurrentColor = Colors.black.obs;
  final _textCurrentColor = Colors.white.obs;
  final _pickerColor = Colors.white.obs;

  get userName => _userName.value;
  set userName(value) => _userName.value = value;

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

  getUser() async {
    var result = await _repository.getUser();
    _userName.value = result.name!;
  }

  changeValue() {
    userName = "Template";
  }

  saveUser() async {
    HiveManager.instance.setStringValue(HiveKeys.USERNAME, userName);
  }

  getFromHiveManager() {
    return HiveManager.instance.getStringValue(HiveKeys.USERNAME);
  }
}
