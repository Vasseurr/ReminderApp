import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/core/constants/colors.dart';
import 'package:reminder_app/core/init/theme/theme_notifier.dart';

import '../../../home/controller/home_controller.dart';

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
        toolbarHeight: context.height * 0.1,
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.01,
                vertical: context.height * 0.01),
            child: InkWell(
              onTap: () {},
              focusColor: MyColors.backgroundColor,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-File.png"),
              ),
            ),
          )
        ],
      ),
      //drawer: Drawer(),
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
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled)),
          CustomNavigationBarItem(icon: Icon(Icons.task)),
          CustomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded)),
        ],
      ),
    );
  }
}
