import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Util {
  static NumberFormat nFormat = NumberFormat('###,###,###,###');

  static void showToast(String massage) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: massage);
  }
}