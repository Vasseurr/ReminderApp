import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../constants/colors.dart';
import '../../init/lang/locale_keys.g.dart';
import '../buttons/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.backgroundColor,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: context.height * 0.03),
                    child: Text(
                      LocaleKeys.basic_appLanguage.tr(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VasseurrBttn(
                          buttonText: LocaleKeys.basic_english.tr(),
                          buttonColor: MyColors.taskCardColor,
                          borderColor: MyColors.taskCardColor,
                          onPressed: () async {
                            Get.updateLocale(const Locale('en', 'US'));
                            await context.setLocale(const Locale('en', 'US'));
                            Get.back();
                          }),
                      VasseurrBttn(
                          buttonText: LocaleKeys.basic_turkish.tr(),
                          buttonColor: MyColors.taskCardColor,
                          borderColor: MyColors.taskCardColor,
                          onPressed: () async {
                            Get.updateLocale(const Locale('tr', 'TR'));
                            await context.setLocale(const Locale('tr', 'TR'));
                            Get.back();
                          }),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
