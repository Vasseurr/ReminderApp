import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminder_app/core/constants/hive_keys.dart';
import 'package:reminder_app/core/objects/reminder_card.dart';
import 'package:reminder_app/core/objects/reminder_card_adapter.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._init();

  static late Box<dynamic> _db;

  static HiveManager get instance => _instance;

  HiveManager._init() {
    openBox();
  }

  static preferencesInit() async {
    await Hive.initFlutter();

    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(ReminderCardAdapter());

    await openBox();
    _db = Hive.box('user');
    return;
  }

  static Future<void> openBox() async {
   _db = await Hive.openBox('user');
  }

  Future<void> setStringValue(HiveKeys key, String value) async {
    await _db.put(key.toString(), value);
  }

  String? getStringValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setIntValue(HiveKeys key, int value) async {
    await _db.put(key.toString(), value);
  }

  int? getIntValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setBoolValue(HiveKeys key, bool value) async {
    await _db.put(key.toString(), value);
  }

  bool? getBoolValue(HiveKeys key) => _db.get(key.toString());

  Future<void> setGenericValue<T>(HiveKeys key, T value) async {
    await _db.put(key.toString(), value);
  }

  T? getGenericValue<T>(HiveKeys key) => _db.get(key.toString());

  Future<void> addReminderObject(ReminderCard card) async {
    await _db.add(card);
  }

  ReminderCard getReminderObject(int index) => _db.getAt(index);

  int totalReminderObject() => _db.length;

  void clear() {
    _db.clear();
  }
}
