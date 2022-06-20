import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cache/hive_manager.dart';

class ProjectInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

    await HiveManager.preferencesInit();
  }
}
