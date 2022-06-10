import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reminder_app/core/components/widgets/task_card.dart';
import 'package:reminder_app/core/extension/context_extension.dart';

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
          child: TaskCard(
            numberOfTask: 22,
            type: "Done",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.6,
          child: TaskCard(
            numberOfTask: 7,
            type: "In progress",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.85,
          child: TaskCard(
            numberOfTask: 12,
            type: "Waiting for Review",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.65,
          child: TaskCard(
            numberOfTask: 10,
            type: "Ongoing",
          ),
        ),
      ],
    );
  }
}
