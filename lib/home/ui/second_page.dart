import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/core/components/buttons/custom_button.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/home/controller/home_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(context.mediumHeightValue),
        child: Column(
          children: [
            Center(
                // child: Text(homeController.getFromHiveManager()),
                ),
            const Spacer(),
            VasseurrBttn(buttonText: "Change value", onPressed: () {}),
          ],
        ),
        /*Center(
          // child: Text(Get.find<HomeController>().userName),
          //child: Text(Hive.box('user').get('name')),
          child: Text(homeController.getFromHiveManager()),
        ),*/
      ),
    );
  }
}
