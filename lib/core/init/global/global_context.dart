import 'package:flutter/cupertino.dart';

class GlobalContext extends ChangeNotifier {
  bool _isShown = false;

  changeShown() {
    _isShown = !_isShown;
    notifyListeners();
  }

  bool get isShown => _isShown;
}
