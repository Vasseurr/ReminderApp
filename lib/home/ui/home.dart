import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/home/controller/home_controller.dart';
import 'package:reminder_app/home/ui/summary.dart';
import 'package:reminder_app/home/ui/home_page.dart';
import 'package:reminder_app/home/ui/person.dart';

import '../../core/components/widgets/custom_scaffold.dart';
import 'notification.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.currentBarIndex,
            children: const [
              HomePage(),
              Summary(),
              Person(),
              Notifications(),
            ],
          ),
        ),
      ),
    );
  }
}
