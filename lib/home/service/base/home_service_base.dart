import 'package:reminder_app/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();
}
