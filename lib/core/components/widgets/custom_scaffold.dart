import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:reminder_app/core/constants/colors.dart';

import '../../../home/controller/home_controller.dart';
import '../../routes/app_routes.dart';
import 'custom_drawer.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.backgroundColor,
      /*  context.read<ThemeNotifier>().currentTheme == ThemeData.light()
              ? MyColors.backgroundColor
              : Colors.black,*/
      appBar: AppBar(
        title: Text(
          _controller.appBarTitle,
          style: context.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        toolbarHeight: context.height * 0.1,
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.01,
                vertical: context.height * 0.01),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Get.toNamed(Routes.NOTIFICATIONS),
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: widget.body,
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: MyColors.selectedTabIndexColor,
        // strokeColor: Colors.black,
        unSelectedColor: Colors.white,
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        currentIndex: _controller.currentBarIndex,
        onTap: (index) {
          setState(() {
            _controller.changeBarIndex(index);
          });
        },
        items: [
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.add_circled)),
          CustomNavigationBarItem(icon: const Icon(Icons.task)),
          CustomNavigationBarItem(icon: const Icon(Icons.history_rounded)),
        ],
      ),
    );
  }
}
