import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reminder_app/core/components/widgets/total_task_card.dart';
import 'package:reminder_app/core/extension/context_extension.dart';
import 'package:reminder_app/core/init/lang/locale_keys.g.dart';

class CustomStaggerGrid extends StatelessWidget {
  const CustomStaggerGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: context.getWidth * 0.05,
      crossAxisSpacing: context.getWidth * 0.05,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.8,
          child: TotalTaskCard(
            numberOfTask: 22,
            type: LocaleKeys.task_done.tr(),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.6,
          child: TotalTaskCard(
            numberOfTask: 7,
            type: LocaleKeys.task_inProgress.tr(),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.85,
          child: TotalTaskCard(
            numberOfTask: 12,
            type: LocaleKeys.task_waitReview.tr(),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.65,
          child: TotalTaskCard(
            numberOfTask: 10,
            type: LocaleKeys.task_onGoing.tr(),
          ),
        ),
      ],
    );
  }
}
