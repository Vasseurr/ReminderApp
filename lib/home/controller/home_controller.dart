import 'package:get/get.dart';
import 'package:reminder_app/core/constants/hive_keys.dart';
import 'package:reminder_app/core/init/cache/hive_manager.dart';
import 'package:reminder_app/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final RxString _userName = "".obs;
  HomeController(this._repository) : assert(_repository != null);

  get userName => _userName.value;

  set userName(value) => _userName.value = value;

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
