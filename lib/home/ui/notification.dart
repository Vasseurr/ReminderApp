import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/core/init/lang/locale_keys.g.dart';

import '../../core/components/widgets/task_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          LocaleKeys.page_notifications.tr(),
          style: context.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        toolbarHeight: context.getHeight * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: context.getHeight * 0.02),
              child: TaskCard(
                title: "Flutter",
                description: "Flutter app dev",
                time: index > 0
                    ? "22/06/2022 ${index + 9}.00"
                    : "22/06/2022 0${index + 9}.00",
              ),
            );
          },
          itemCount: 10,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
