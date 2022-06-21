import 'package:flutter/cupertino.dart';
import 'package:reminder_app/core/constants/preferences_keys.dart';
import 'package:reminder_app/core/init/cache/preferences_manager.dart';

class GlobalContext extends ChangeNotifier {
  bool _isShown = false;
  //? activate/deactivate push notification in menu
  bool _sendNotification = false;

  GlobalContext() {
    _sendNotification =
        PreferencesManager.instance.getBoolValue(PreferencesKeys.ISFIRST) ??
            false;
  }

  changeShown() {
    _isShown = !_isShown;
    notifyListeners();
  }

  changeSendNotificationSwitch() {
    _sendNotification = !_sendNotification;
    PreferencesManager.instance
        .setBoolValue(PreferencesKeys.ISFIRST, _sendNotification);
    notifyListeners();
  }

  bool get isShown => _isShown;
  bool get isSendNotification => _sendNotification;
}
