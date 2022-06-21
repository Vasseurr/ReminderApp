import 'package:get/get.dart';
import 'package:reminder_app/core/pages/login_page.dart';
import 'package:reminder_app/home/bindings/home_binding.dart';
import 'package:reminder_app/home/ui/add_reminder.dart';
import 'package:reminder_app/home/ui/home.dart';
import 'package:reminder_app/home/ui/home_page.dart';
import 'package:reminder_app/home/ui/reminder.dart';
import 'package:reminder_app/home/ui/settings.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: HomeBinding()),
    GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBinding()),
    GetPage(
        name: Routes.REMINDER_LIST,
        page: () => ReminderList(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.ADD_REMINDER,
        page: () => const AddReminder(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.SETTINGS,
        page: () => const Settings(),
        binding: HomeBinding()),
  ];
}
