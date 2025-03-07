import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier {
  int count = 0;
  
  void countUp() {
    count++;

    /// 리스너들에게 현재 ChangeNotifier 클래스에 있는
    /// 변수들의 값이 변경되었다고 알린다.
    notifyListeners();
  }
}