import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/constants/icon_URL.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/core/init/lang/locale_keys.g.dart';

import '../../core/components/widgets/custom_staggered_grid.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getWidth * 0.06,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(context),
          _mainCard(context),
          _review(context),
        ],
      ),
    );
  }

  Column _review(BuildContext context) {
    return Column(
      children: [
        _typeReview(context),
        Container(
          height: context.getHeight * 0.35,
          margin: EdgeInsets.only(top: context.getHeight * 0.03),
          child: const CustomStaggerGrid(),
        )
      ],
    );
  }

  Row _typeReview(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.feature_monthlyReview.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Image.asset(
            IconURL.CALENDAR,
            height: context.getHeight * 0.05,
          ),
        )
      ],
    );
  }

  Container _mainCard(BuildContext context) {
    return Container(
      height: context.getHeight * 0.13,
      padding: EdgeInsets.symmetric(horizontal: context.getWidth * 0.05),
      decoration: BoxDecoration(
          color: MyColors.taskCardColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Mobile App Design",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 17,
                  color: MyColors.pendingTaskColor,
                ),
              ),
              Text(
                "NOW",
                style: TextStyle(
                  fontSize: 17,
                  color: MyColors.pendingTaskColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.basic_hi.tr() + " Okan",
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: context.getHeight * 0.02),
        Text(
          "6 " + LocaleKeys.task_pendingTask.tr(),
          style: const TextStyle(
            fontSize: 17,
            color: MyColors.pendingTaskColor,
          ),
        ),
      ],
    );
  }
}
