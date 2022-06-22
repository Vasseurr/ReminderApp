import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:provider/provider.dart';
import 'package:reminder_app/core/extension/lottie_path_extension.dart';
import 'package:reminder_app/core/init/global/global_context.dart';
import 'package:reminder_app/core/init/theme/theme_notifier.dart';

import '../../constants/colors.dart';
import '../../init/lang/locale_keys.g.dart';
import '../../routes/app_routes.dart';
import '../buttons/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.03, vertical: context.height * 0.05),
        child: ListView(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.picsum.photos/id/110/200/200.jpg?hmac=aekmsQTsPRt4hCd1khMC5QVihAaBeTigUCpcDBzhXlY",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Okan Rüzgar",
                    style: context.textTheme.headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.05),
              child: option(
                context,
                leading: Icons.settings,
                title: "Settings",
                trailing: Icons.keyboard_arrow_right_sharp,
                onTap: () => Get.toNamed(Routes.SETTINGS),
              ),
            ),
            option(context,
                leading: Icons.rate_review,
                title: "Rate us",
                trailing: Icons.keyboard_arrow_right_sharp,
                onTap: () {}),
            option(context,
                leading: Icons.person,
                title: "Developer",
                trailing: Icons.keyboard_arrow_right_sharp,
                onTap: () {}),
            _pushNotificationSwitch(context),
            ListTile(
              //leading: Icon(Icons.theme),
              title: Text('Theme Change',
                  style: context.textTheme.headline6!
                      .copyWith(color: Colors.white, fontSize: 16)),
              trailing: IconButton(
                  icon: context.watch<ThemeNotifier>().isThemeLight
                      ? LottiePathEnum.MOON.toWidget
                      : LottiePathEnum.SUNNY.toWidget,
                  onPressed: () => context.read<ThemeNotifier>().changeTheme()),
            ),
            // _englishLng(context),
            //  _turkishLng(context),
            _logout(context),
          ],
        ),
      ),
    );
  }

  Padding _pushNotificationSwitch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.05),
      child: ListTile(
        leading: const Icon(
          Icons.notifications_on_rounded,
          color: Colors.white,
          size: 30,
        ),
        title: Text("Push notification",
            style: context.textTheme.headline6!
                .copyWith(color: Colors.white, fontSize: 16)),
        trailing: Switch(
            activeColor: MyColors.taskCardColor,
            value: context.watch<GlobalContext>().isSendNotification,
            onChanged: (value) =>
                context.read<GlobalContext>().changeSendNotificationSwitch()),
      ),
    );
  }

  Container _logout(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: context.width * 0.03,
          right: context.width * 0.3,
          top: context.height * .06),
      child: VasseurrBttn(
        buttonText: "Logout",
        fontSize: 14,
        buttonColor: MyColors.taskCardColor,
        borderColor: MyColors.taskCardColor,
        onPressed: () {},
      ),
    );
  }

  ListTile _turkishLng(BuildContext context) {
    return ListTile(
      onTap: () async {
        Get.updateLocale(const Locale('tr', 'TR'));
        await context.setLocale(const Locale('tr', 'TR'));
      },
      title: Text(LocaleKeys.basic_turkish.tr(),
          style: context.textTheme.headline6!
              .copyWith(color: Colors.white, fontSize: 16)),
      trailing: context.locale.toString() == "tr_TR"
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            )
          : const SizedBox(),
    );
  }

  ListTile _englishLng(BuildContext context) {
    return ListTile(
      onTap: () async {
        Get.updateLocale(const Locale('en', 'US'));
        await context.setLocale(const Locale('en', 'US'));
      },
      title: Text(LocaleKeys.basic_english.tr(),
          style: context.textTheme.headline6!
              .copyWith(color: Colors.white, fontSize: 16)),
      trailing: context.locale.toString() == "en_US"
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            )
          : const SizedBox(),
    );
  }

  ListTile option(BuildContext context,
      {required IconData leading,
      required String title,
      required IconData trailing,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leading,
        color: Colors.white,
      ),
      title: Text(title,
          style: context.textTheme.headline6!
              .copyWith(color: Colors.white, fontSize: 16)),
      trailing: Icon(
        trailing,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
