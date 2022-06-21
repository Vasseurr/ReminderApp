import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/core/init/global/global_context.dart';
import 'package:reminder_app/core/init/init.dart';
import 'package:reminder_app/core/init/theme/theme_notifier.dart';

import 'core/init/cache/localization_manager.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  ProjectInit.init();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.instance.supportedLocales,
      path: LocalizationManager.instance.localizationPath,
      startLocale: LocalizationManager.instance.getStartLocale(),
      fallbackLocale: LocalizationManager.instance.getStartLocale(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalContext>(
              create: (context) => GlobalContext()),
          ChangeNotifierProvider<ThemeNotifier>(
              create: (context) => ThemeNotifier()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<ThemeNotifier>().currentTheme,
      //theme: AppThemeLight.instance.theme,
      getPages: AppPages.pages,
    );
  }
}
